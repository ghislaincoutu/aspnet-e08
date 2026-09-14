import { Component, OnInit, inject, ChangeDetectorRef } from '@angular/core';
import { AddressesService, Addresses } from '../../services/addresses.service';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { Router } from '@angular/router';

@Component({
  imports: [CommonModule, FormsModule],
  selector: 'app-addresses',
  styleUrl: './addresses.component.scss',
  templateUrl: './addresses.component.html',
})

export class AddressesComponent {
  addresses10: Addresses[] = [];
  addresses12: Addresses = { id: 0, catId: '', title: '', url: '', enterprise: '' };

  private readonly router = inject(Router);
  private readonly detector10 = inject(ChangeDetectorRef);
  private reset = inject(AddressesService);
  constructor(private service: AddressesService) { }

  ngOnInit() {
    this.load17();
  }

  load17(): void {
    this.service.getAll().subscribe({
      next: data => {
        console.log('getAll retourne :', data);
        this.addresses10 = data;
        this.detector10.detectChanges();
      },
      error: err => {
        console.error('getAll erreur :', err);
      }
    });
  }

  save() {
    if (this.addresses12.id === 0) {
      this.service.create(this.addresses12).subscribe(() => this.load17());
    } else {
      this.service.update(this.addresses12).subscribe(() => this.load17());
    }
    this.addresses12 = { id: 0, catId: '', title: '', url: '', enterprise: '' };
  }

  edit(a: Addresses) {
    this.router.navigate(['/edit-address', a.id]);
  }

  delete(id: number): void {
    const confirmation = window.confirm(
      'Voulez-vous vraiment supprimer cet enregistrement?'
    );
    if (!confirmation) {
      return;
    }
    this.service.delete(id).subscribe({
      next: () => {
        this.load17();
      },
      error: (err) => {
        console.error('Erreur lors de la suppression', err);
        window.alert('Une erreur est survenue lors de la suppression.');
      }
    });
  }

  resetDatabase(): void {
    const confirmation = window.confirm(
      'Attention : tous les enregistrements seront supprimés. Voulez-vous continuer?'
    );
    if (!confirmation) {
      return;
    }
    this.reset.resetDatabase().subscribe({
      next: (response) => {
        window.alert(response.message);
        this.load17();
      },
      error: (err) => {
        console.error('Erreur lors de la réinitialisation', err);
        window.alert('Une erreur est survenue lors de la réinitialisation.');
      }
    });
  }

  create80(): void {
    this.router.navigate(['/edit-address', 0]);
  }
}
