import { Component, OnInit, inject, ChangeDetectorRef } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { AddressesService, Addresses } from '../../services/addresses.service';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';

@Component({
  imports: [CommonModule, FormsModule],
  selector: 'app-edit-address',
  styleUrl: './edit-address.component.scss',
  templateUrl: './edit-address.component.html',
})

export class EditAddressComponent implements OnInit {
  addresses12: Addresses = {
    id: 0,
    catId: '',
    title: '',
    url: '',
    enterprise: ''
  };

  private readonly route = inject(ActivatedRoute);
  private readonly router = inject(Router);
  private readonly service = inject(AddressesService);
  private readonly cdr = inject(ChangeDetectorRef);

  ngOnInit(): void {
    const idParam = this.route.snapshot.paramMap.get('id');
    const id = Number(idParam);

    // Création d'un nouvel enregistrement.
    if (!id || id === 0) {
      this.addresses12 = {
        id: 0,
        catId: '',
        title: '',
        url: '',
        enterprise: ''
      };
      return;
    }
    // Modification d'un enregistrement existant.
    this.service.get(id).subscribe({
      next: (address) => {
        console.log('Adresse reçue par l’API :', address);
        this.addresses12 = address;
        this.cdr.detectChanges();
      },
      error: (err) => {
        console.error(
          'Erreur lors du chargement de l’adresse :',
          err
        );
      }
    });
  }

  save(): void {
    const request = this.addresses12.id === 0
      ? this.service.create(this.addresses12)
      : this.service.update(this.addresses12);

    request.subscribe({
      next: () => {
        console.log('Adresse enregistrée');
        this.router.navigate(['/addresses']);
      },
      error: (err) => {
        console.error('Erreur API lors de l’enregistrement :', err);
      }
    });
  }
}