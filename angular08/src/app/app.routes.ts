import { Routes } from '@angular/router';
import { AddressesComponent } from './components/addresses/addresses.component';
import { EditAddressComponent } from './components/edit-address/edit-address.component';

export const routes: Routes = [
  {
    path: 'addresses',
    component: AddressesComponent
  },
  {
    path: 'edit-address/:id',
    component: EditAddressComponent
  },
  {
    path: '',
    redirectTo: 'addresses',
    pathMatch: 'full'
  },
  {
    path: '**',
    redirectTo: 'addresses'
  }
];
