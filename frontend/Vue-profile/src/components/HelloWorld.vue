<script>
import axios from 'axios';

const user = 'admin';
const pass = 'password123';
const URL = 'http://127.0.0.1:8000';

export default {
  props: {
    title: String
  },
  methods: {
    getData(event) {
      axios.get(URL+'/profiles/', {
        'auth': {
          username: user,
          password: pass
        }
      })
      .then(response => {
        console.log(response.data);
        const data = response.data;
        this.profiles = data.results;

      })
      .catch((error) => console.log(error.toJSON()))
    },
    deleteFirst(event) {
      axios.delete(URL+'/profiles/'+(this.profiles[0].pk)+'/', {
        'auth': {
          username: user,
          password: pass
        }
      })
      .then(response => {
        this.getData()
      })
      .catch((error) => console.log(error.toJSON()))
    }
  },
  mounted() {
    this.getData()
  },
  data() {
    return {
      profiles: []
    }
  }
}
</script>

<template>
  <div class="">
    <h1 class="p-4 mb-4 text-4xl capitalize text-black 
    text-center border rounded-xl border-green-700
    bg-gradient-to-t from-green-400 to-green-800"
    >
    {{ title }}</h1>
    <div class="divider">Basic Functions</div>
    <div class="flex justify-center mb-4">
      <button
       @click="getData"
        class="btn bg-green-500 m-2 w-48 text-lg hover:text-white text-black"
        >
        Get data
      </button>
      <button
       @click="deleteFirst"
        class="btn bg-red-500 m-2 w-48 text-lg hover:text-white text-black"
        >
        Delete First Item
      </button>
    </div>
    <div class="divider">List of profiles</div>
      <div class="grid sm:grid-cols-1 md:grid-cols-2 lg:grid-cols-3">
        <div
          v-for="(item, k) in profiles" :key="k"
          class="
          card bg-base-100 shadow-xl mb-4 mx-2"
        >
        <!-- profile pics -->
        <div class="avatar justify-center mt-8">
          <div class="w-24 rounded-full ring ring-success
          ring-offset-base-100 ring-offset-2"
          >
            <img src="https://placeimg.com/192/192/people" />
          </div>
        </div>
        <!-- Card box -->
        <div class="card-body items-center text-center">
          <!-- Profile name -->
          <h2 class="card-title">{{ item.name }}</h2>
          <!-- Profile description -->
          <p>{{ item.description }}</p>
        </div>
      </div>
    </div>
  </div>
</template>
