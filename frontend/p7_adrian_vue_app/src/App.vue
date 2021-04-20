<template>
  <div id="app">
    <Header></Header>
    <Login v-if="$route.name === 'login'" @logingIn="logedUser" :key="$route.fullPath"></Login>
    <Register v-if="$route.name === 'register'" @logingIn="logedUser" :key="$route.fullPath"></Register>
    <AddPost v-if="$route.name === 'addpost'"></AddPost>
    <PostList v-if="$route.name === 'postlist'"></PostList>
    <SinglePost v-if="$route.name === 'singlepost'"></SinglePost>
    <EditPost v-if="$route.name === 'editpost'"></EditPost>
    <Profile v-if="$route.name === 'profile'"></Profile>
    <NotFound v-if="$route.name !== 'login' && $route.name !== 'register' && $route.name !== 'postlist' && $route.name !== 'singlepost' && $route.name !== 'addpost' && $route.name !== 'editpost' && $route.name !== 'profile'"></NotFound>
    <Footer v-if="$route.name !== 'postlist' && $route.name !== 'singlepost'"></Footer>
  </div>
</template>

<script>
import Header from './components/Header';
import Footer from "./components/Footer";
import Login from './components/Login';
import Register from './components/Register';
import AddPost from './components/AddPost';
import PostList from './components/PostList';
import SinglePost from './components/SinglePost';
import EditPost from './components/EditPost';
import NotFound from './components/NotFound';
import Profile from './components/Profile';

export default {
  name: 'App',
  data() {
    return {
      loggedIn: false,
      userId: ''
    }
  },
  components: {
    Header,
    Footer,
    Login,
    Register,
    AddPost,
    PostList,
    SinglePost,
    EditPost,
    NotFound,
    Profile
  },
  methods: {
    logedUser(logingIn) {
      this.userId = logingIn
      this.loggedIn = true;
    }
  }
}
</script>

<style>
#app {
  height: 100vh;
  display: flex;
  flex-flow: column;
  justify-content: space-between;
}

a {
  color: inherit;
}
</style>
