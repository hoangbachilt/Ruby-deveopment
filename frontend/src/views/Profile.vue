<template>
  <div class="contatiner">
    <p>
      <button
        class="btn btn-primary"
        type="button"
        data-toggle="collapse"
        data-target="#invitation"
        aria-expanded="false"
        aria-controls="invitation"
      >
        {{ $t("invitations") }}
      </button>
    </p>
    <div class="row">
      <div class="col">
        <div id="invitation">
          <div
            v-for="invitation in invitations"
            :key="invitation.id"
            class="card card-body"
          >
            {{ $t("invite_from") }} {{ invitation.sender_id }}
            <button class="btn" @click="acceptInvite(invitation.id)">
              {{ $t("accept") }}
            </button>
            <button class="btn" @click="declineInvite(invitation.id)">
              {{ $t("decline") }}
            </button>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import axios from "axios";
import authHeader from "@/services/auth-header";

export default {
  data() {
    return {
      invitations: [],
      errors: []
    };
  },
  created() {
    let self = this;
    axios
      .get("/invitations", { headers: authHeader() })
      .then(response => {
        self.invitations = response.data;
      })
      .catch(e => {
        this.errors.push(e);
      });
  },
  methods: {
    acceptInvite(id) {
      axios.put(`invitations/${id}`, {},{ headers: authHeader() }).catch(e => {
        self.errors.push(e.response.data);
      });
    },
    declineInvite(id) {
      axios.delete(`invitations/${id}`, { headers: authHeader() }).catch(e => {
        self.errors.push(e.response.data);
      });
    }
  }
};
</script>
