import { Component, OnInit, inject, ChangeDetectorRef } from '@angular/core';
import { AddressesService, Addresses } from '../../services/addresses.service';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';

@Component({
  selector: 'app-addresses',
  imports: [CommonModule, FormsModule],
  styleUrl: './addresses.component.scss',
  templateUrl: './addresses.component.html',
})

export class AddressesComponent {
  addresses10: Addresses[] = [];
  addresses12: Addresses = { id: 0, catId: '', title: '', url: '', enterprise: '' };

  private readonly detector10 = inject(ChangeDetectorRef);
  private resetDatabase = inject(AddressesService);
  constructor(private service: AddressesService) { }

  ngOnInit() {
    this.load();
  }

  load(): void {
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
      this.service.create(this.addresses12).subscribe(() => this.load());
    } else {
      this.service.update(this.addresses12).subscribe(() => this.load());
    }
    this.addresses12 = { id: 0, catId: '', title: '', url: '', enterprise: '' };
  }

  edit(a: Addresses) {
    this.addresses12 = { ...a };
  }

  delete(id: number) {
    this.service.delete(id).subscribe(() => this.load());
  }
}
