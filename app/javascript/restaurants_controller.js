// app/javascript/controllers/restaurants_controller.js

import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["list"];

  connect() {
    this.fetchRestaurants();
  }

  fetchRestaurants() {
    fetch('https://the-fork-api.students.lewagon.co/api/v1/restaurants')
      .then(response => response.json())
      .then(restaurants => {
        this.renderRestaurants(restaurants);
      })
      .catch(error => console.error('Erro ao buscar restaurantes:', error));
  }

  renderRestaurants(restaurants) {
    const listTarget = this.listTarget;
    listTarget.innerHTML = "";

    restaurants.forEach(restaurant => {
      const card = document.createElement('div');
      card.classList.add('col-4');

      card.innerHTML = `
        <div class="card mt-3" style="width: 18rem;">
          <img src="restaurant.jpg" class="card-img-top" alt="...">
          <div class="card-body">
            <h5 class="card-title">${restaurant.name}</h5>
          </div>
          <ul class="list-group list-group-flush">
            <li class="list-group-item"><strong>Endereço: </strong>${restaurant.address}</li>
            <li class="list-group-item"><strong>Categoria: </strong>${restaurant.category}</li>
          </ul>
          <div class="card-body">
            <a href="/restaurants/${restaurant.id}" class="btn btn-primary">Sobre</a>
          </div>
        </div>
      `;

      listTarget.appendChild(card);
    });
  }
}
