<template>
  <div id="folder">
    <h1> New Folders </h1>
    <p v-if="errors.length">
    <ul>
      <li v-for="error in errors" :key="error.id">{{ error }}</li>
    </ul>
    </p>
    <form v-on:submit.prevent="handleSubmit">
      <input type="radio" id="one" value="true" v-model="status" />
      <label for="one">private</label>
      <br />
      <input type="radio" id="two" value="false" v-model="status" />
      <label for="two">public</label>
      <br />
      <input v-model="name" type="name" placeholder="Nhập tên folder" />
      <br />
      <button type="submit" class="btn btn-dark btn-lg btn-block success">Add</button>
    </form>
    <table class="table">
      <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Status</th>
      </tr>
      <tr v-for="folder in folders" :key="folder.id">
        <td>{{ folder.id}}</td>
        <td>{{ folder.name}}</td>
        <td>{{ folder.status}}</td>
      </tr>
    </table>
  </div>
</template>
<script>
import axios from "axios";
import authHeader from "@/services/auth-header";
export default {
  data() {
    return {
      folders: [],
      status: false,
      name: "",
      errors: [],
    };
  },
  methods: {
    handleSubmit() {
      let postdata = {
          status: this.status,
          name: this.name,
        },
        config = {
          headers: authHeader()
        };
      axios
        .post("/folders", postdata, config)
        .then(response => {
          
          this.folders.push(response.data.folder)
          confirm("Do you want to create?");
        })
        .catch(e => {
          this.errors = JSON.parse(e.response.data.message);
        });
    }
  }
};
</script>
