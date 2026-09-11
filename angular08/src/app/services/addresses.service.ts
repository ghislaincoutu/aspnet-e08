import { Injectable, inject } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';

export interface Addresses {
  id: number;
  catId: string;
  title: string;
  url: string;
  enterprise: string;
}

@Injectable({
  providedIn: 'root',
})

export class AddressesService {
  private readonly http = inject(HttpClient);
  private api = "/api/addresses";
  private reset = '/api/addresses/reset';

  getAll(): Observable<Addresses[]> {
    return this.http.get<Addresses[]>(this.api);
  }

  create(addresses: Addresses) {
    return this.http.post(this.api, addresses);
  }

  update(addresses: Addresses) {
    return this.http.put(`${this.api}/${addresses.id}`, addresses);
  }

  delete(id: number) {
    return this.http.delete(`${this.api}/${id}`);
  }

  resetDatabase(): Observable<any> {
    return this.http.post<any>(this.reset, {});
  }
}