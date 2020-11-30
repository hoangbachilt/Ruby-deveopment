<template>
  <div class="home">
    <div class="row">
      <div class="owner">
        <h2 class="title"><span>{{ $t("folder") }}</span></h2>
      </div>
      <div v-for="folder in folders" :key="folder.id" class="col-sm">
        <router-link :to="{ name: 'folder', params: { id: folder.id } }">
          <img class="image_folder" src="../assets/folder.png" /> <br />
          {{ folder.name }}
        </router-link>
        <div v-if="folder.user_id == 1">
          {{ $t("owner_folders") }}
        </div>
        <div v-else-if="folder.status == false">
          {{ $t("public_folders") }}
        </div>
        <div v-else-if="folder.user_id != 1">
          {{ $t("shared_folders") }} {{ folder.user_id }}
        </div>
      </div>
    </div>
    <paginate
      :page-count="this.total_page"
      :page-range="1"
      :margin-pages="2"
      :click-handler="clickCallback"
      :prev-text="'Prev'"
      :next-text="'Next'"
      :container-class="'pagination'"
      :page-class="'page-item'"
    >
    </paginate>
  </div>
</template>

<script>
import axios from "axios";
import authHeader from "@/services/auth-header";

export default {
  data() {
    return {
      folders: [],
      page: null,
      total_page: null,
      errors: []
    };
  },
  created() {
    this.dataPerPage();
  },
  methods: {
    clickCallback(pageNum) {
      this.page = pageNum;
      this.dataPerPage();
    },
    dataPerPage() {
      axios
      .get("/folders", {
        params: {
          page: this.page
        }, headers: authHeader()
      })
      .then(response => {
        this.folders = response.data.folders;
        this.total_page = response.data.total_page;
      })
      .catch(e => {
        this.errors.push(e);
      });
    }
  }
};
</script>

<style lang="scss">
.image_folder {
  border-radius: 8px;
  width: 150px;
  height: 150px;
}

.owner {
  margin-bottom: 30px;
}

h2 {
  font: 33px sans-serif;
  margin-top: 30px;
  text-align: center;
  text-transform: uppercase;
}

h2.title {
  position: relative;
  z-index: 1;

  &:before {
    border-top: 2px solid #dfdfdf;
    content: "";
    margin: 0 auto;
    position: absolute;
    top: 50%;
    left: 0;
    right: 0;
    bottom: 0;
    width: 95%;
    z-index: -1;
  }

  span {
    background: #fff;
    padding: 0 15px;
  }
}

.pagination {
}

.page-item {
}
</style>
