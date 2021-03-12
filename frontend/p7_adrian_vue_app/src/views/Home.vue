<template>
  <b-container>
    <b-row allign-v="center">
      <b-col md="4">
        <b-card>
          <b-img src="https://unsplash.com/photos/YNliXm_hMn8"></b-img>
        </b-card>
      </b-col>

      <b-col md="4">
        <b-card
          title="Have you been here before?"
          img-src="https://unsplash.com/photos/YNliXm_hMn8"
          img-alt="logo"
          img-top
          style="max-width:20rem"
          class="mb-2"
        >
          <b-card-text>
            Welcome again. Press the button to Log In again.
          </b-card-text>
          <b-button variant="primary">Sign In</b-button>
        </b-card>
      </b-col>

      <b-col md="4">
        <b-card
          title="First time on our website?"
          img-src="@/assets/icon.png"
          img-alt="logo"
          img-top
          style="max-width:20rem"
          class="mb-2"
        >
          <b-card-text>
            Press Sign Up to use our services!
          </b-card-text>
          <b-button variant="primary">Sign Up</b-button>
        </b-card>
      </b-col>
    </b-row>
  </b-container>
</template>

<script>
// @ is an alias to /src
//import HelloWorld from "@/components/HelloWorld.vue";

export default {
  name: "Home",
  components: {}
};
</script>
