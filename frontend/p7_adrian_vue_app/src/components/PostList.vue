<template>
    <div  class="postcontainer" style="scrollbar-width: none;">
        <div v-if="sortPostsDifferentUser.length < 1">
            <h1>Start sharing your gif with the community</h1>
        </div>
        <div v-else class="imagetitlecontainer" v-for="post in sortPostsDifferentUser" :key="post.postID">
            <h2 style="color: black; display: inline;">Post Author Name : </h2>
            <h3 style="color: blue; display: inline;">{{ post.Name }}</h3>
            <p></p>
            <h2 style="color: black; display: inline;">Title of subject : </h2>
            <h3 style=" color: blue; margin-bottom: 4%; word-wrap:break-word; display: inline;">{{ post.Title }}</h3>
            <img :src="post.ImageURL" alt="">
            <div class="iconcontainer">
                <div :key="componentKey" class="icons1">
                    <span style="cursor: pointer" v-if="sortPostLikesCurrentUser.filter(s => s.PostID === post.PostID).length === 0 && sortPostDislikesCurrentUser.filter(s => s.PostID === post.PostID).length === 0"><i :id="post.PostID" @click="likePost($event)" class="fas fa-thumbs-up"></i>{{ postLikes.filter(s => s.PostID === post.PostID).length }}</span>
                    <span style="cursor: pointer" v-if="sortPostLikesCurrentUser.filter(s => s.PostID === post.PostID).length === 1 && sortPostDislikesCurrentUser.filter(s => s.PostID === post.PostID).length === 0"><i style="color: yellowgreen" :id="post.PostID" @click="deleteLikePost($event)" class="fas fa-thumbs-up"></i>{{ postLikes.filter(s => s.PostID === post.PostID).length }}</span>
                    <span v-if="sortPostDislikesCurrentUser.filter(s => s.PostID === post.PostID).length === 1 && sortPostLikesCurrentUser.filter(s => s.PostID === post.PostID).length === 0"><i style="opacity: 0.4;" class="fas fa-thumbs-up"></i>{{ postLikes.filter(s => s.PostID === post.PostID).length }}</span>
                    <span style="cursor: pointer" v-if="sortPostDislikesCurrentUser.filter(s => s.PostID === post.PostID).length === 0 && sortPostLikesCurrentUser.filter(s => s.PostID === post.PostID).length === 0"><i :id="post.PostID" @click="dislikePost($event)" class="fas fa-thumbs-down"></i>{{ postDislikes.filter(s => s.PostID === post.PostID).length }}</span>
                    <span style="cursor: pointer" v-if="sortPostDislikesCurrentUser.filter(s => s.PostID === post.PostID).length === 1 && sortPostLikesCurrentUser.filter(s => s.PostID === post.PostID).length === 0"><i style="color: crimson" :id="post.PostID" @click="deleteDislikePost($event)" class="fas fa-thumbs-down"></i>{{ postDislikes.filter(s => s.PostID === post.PostID).length }}</span>
                    <span v-if="sortPostLikesCurrentUser.filter(s => s.PostID === post.PostID).length === 1 && sortPostDislikesCurrentUser.filter(s => s.PostID === post.PostID).length === 0"><i style="opacity: 0.4;" class="fas fa-thumbs-down"></i>{{ postDislikes.filter(s => s.PostID === post.PostID).length }}</span>
                    <router-link  :to="{ name: 'singlepost', params: { postId: post.PostID }}">
                        <span><i @click="markPostAsRead($event)" :id="post.PostID" class="far fa-comments"></i></span>
                    </router-link>
                </div>
                <div @click="markPostAsRead($event)" :id="post.PostID" class="icons2">
                    <span v-if="post.UserID !== logedInUser && !getLocalStorage.hasOwnProperty(post.PostID)"><i @click="markPostAsRead($event)" :id="post.PostID" class="fas fa-bell"></i></span>
                </div>
            </div>
            <hr>
            <h3 style=" color: black; margin-bottom: 4%; word-wrap:break-word; display: inline; text-align: right;">{{ post.DateTime }}</h3>
            <hr>
        </div>
    </div>
</template>

<script>
import axios from 'axios';

export default {
    name: 'PostList',
    data() {
        return {
            userDetails: [],
            posts: [],
            postLikes: [],
            postDislikes: [],
            scrolled: false,
            componentKey: 0
        }
    },
    computed: {
        sortPostsFromCurrentUser() {
            return [...this.posts]
            .filter(s => s.UserID === sessionStorage.getItem('userId') || Object.prototype.hasOwnProperty.call(this.getLocalStorage, s.PostID))
            .sort((a, b) => new Date(b.DateTime) - new Date(a.DateTime))
        },
        sortPostsDifferentUser() {
            return [...this.posts]
            .filter(s => s.UserID !== sessionStorage.getItem('userId') && !Object.prototype.hasOwnProperty.call(this.getLocalStorage, s.PostID))
            .sort((a, b) => new Date(b.DateTime) - new Date(a.DateTime))
            .concat(this.sortPostsFromCurrentUser)
        },
        logedInUser() {
            return sessionStorage.getItem('userId')
        },
        getLocalStorage() {
            return JSON.parse(localStorage.getItem(sessionStorage.getItem('userId'))) || 0 
        },
        sortPostLikesCurrentUser() {
            return [...this.postLikes]
            .filter(s => s.UserID === sessionStorage.getItem('userId'))
        },
        sortPostDislikesCurrentUser() {
            return [...this.postDislikes]
            .filter(s => s.UserID === sessionStorage.getItem('userId'))
        }       
    },
    methods: {
        getUserDetails() {
            axios.get('http://localhost:3000/api/auth/profile/' + this.$route.params.userId,
            { headers:
                {
                'Authorization': `Bearer ${sessionStorage.getItem('token')}`, 
                }
            }).then((response) => {
                if (response.data.status === '200') {
                    this.userDetails = response.data.data[0]
                } else if (response.data.status === '401') {
                    alert(response.data.message)
                    this.$store.commit('logout')
                } else {
                    alert(response.data.message)
                }
            }).catch((err => {
                alert(err)
            }))
        },
        getPosts() {
            axios.get('http://localhost:3000/api/post',
            { headers:
                {
                'Authorization': `Bearer ${sessionStorage.getItem('token')}`, 
                }
            }).then((response) => {
                if (response.data.status === '200') {
                    this.posts = response.data.data
                } else if (response.data.status === '401') {
                    alert(response.data.message)
                    this.$store.commit('logout')
                } else {
                    alert(response.data.message)
                }
            }).catch((err => {
                alert(err)
            }))
        },
        getPostLikes() {
            axios.get('http://localhost:3000/api/post/postlikes',
            { headers:
                {
                'Authorization': `Bearer ${sessionStorage.getItem('token')}`, 
                }
            }).then((response) => {
                if (response.data.status === '200') {
                    this.postLikes = response.data.data
                } else if (response.data.status === '401') {
                    alert(response.data.message)
                    this.$store.commit('logout')
                } else {
                    alert(response.data.message)
                }               
            }).catch((err => {
                alert(err)
            }))
        }, 
        getPostDislikes() {
            axios.get('http://localhost:3000/api/post/postdislikes',
            { headers:
                {
                'Authorization': `Bearer ${sessionStorage.getItem('token')}`, 
                }
            }).then((response) => {
                if (response.data.status === '200') {
                    this.postDislikes = response.data.data
                } else if (response.data.status === '401') {
                    alert(response.data.message)
                    this.$store.commit('logout')
                } else {
                    alert(response.data.message)
                }                   
            }).catch((err => {
                alert(err)
            }))
        },
        likePost($event) {
            axios.post('http://localhost:3000/api/post/likepost', { postId: $event.target.id,  userId: sessionStorage.getItem('userId')}, {
            headers: {
                    'Authorization': `Bearer ${sessionStorage.getItem('token')}`,
                    'Content-Type': 'application/json'  
                }
            },
            ).then((response) => {
                if (response.data.status === '200') {
                    this.getPostLikes()
                } else if (response.data.status === '401') {
                    alert(response.data.message)
                    this.$store.commit('logout')
                } else {
                    alert(response.data.message)
                }      
            }).catch((err => {
                alert(err)
            }))
        },
        dislikePost($event) {
            axios.post('http://localhost:3000/api/post/dislikepost', { postId: $event.target.id,  userId: sessionStorage.getItem('userId')}, {
            headers: {
                    'Authorization': `Bearer ${sessionStorage.getItem('token')}`,
                    'Content-Type': 'application/json'  
                }
            },
            ).then((response) => {
                if (response.data.status === '200') {
                    this.getPostDislikes()
                } else if (response.data.status === '401') {
                    alert(response.data.message)
                    this.$store.commit('logout')
                } else {
                    alert(response.data.message)
                } 
            }).catch((err => {
                alert(err)
            }))
        },
        deleteLikePost($event) {
            axios.delete('http://localhost:3000/api/post/deletelikepost/' + $event.target.id + '/' + sessionStorage.getItem('userId'), {
                headers: {
                    Authorization: `Bearer ${sessionStorage.getItem('token')}`
                },
            }).then((response) => {
                if (response.data.status === '200') {
                    this.getPostLikes()
                } else if (response.data.status === '401') {
                    alert(response.data.message)
                    this.$store.commit('logout')
                } else {
                    alert(response.data.message)
                } 
            }).catch((err => {
                alert(err)
            }))
        },
        deleteDislikePost($event) {
            axios.delete('http://localhost:3000/api/post/deletedislikepost/' + $event.target.id + '/' + sessionStorage.getItem('userId'), {
                headers: {
                    Authorization: `Bearer ${sessionStorage.getItem('token')}`
                },
            }).then((response) => {
                if (response.data.status === '200') {
                    this.getPostDislikes()
                } else if (response.data.status === '401') {
                    alert(response.data.message)
                    this.$store.commit('logout')
                } else {
                    alert(response.data.message)
                } 
            }).catch((err => {
                alert(err)
            }))
        },
        forceRerender() {
            this.componentKey += 1;
        },
        
        markPostAsRead($event) {
            $event.target.style.visibility = 'hidden'
            let readPost = localStorage.getItem(sessionStorage.getItem('userId'))
            readPost = JSON.parse(readPost)
            readPost = {
                ...readPost,
                [$event.target.id]: $event.target.id
            }
            localStorage.setItem(sessionStorage.getItem('userId'), JSON.stringify(readPost))
        }
    },
    beforeMount() {
        this.getPosts(),
        this.getPostLikes(),
        this.getPostDislikes()
    },
}
</script>

<style>

hr {
    width: 90%;
}

h3 {
    font-style: italic;
}

.postcontainer {
    display: flex;
    flex-flow: column;
    margin: 0 auto auto auto;
    overflow-y: auto;
    overflow-x: hidden;
    width: 90%;
}

.iconcontainer {
    display: flex;
    flex-flow: row;
    justify-content: space-around;
}

.iconcontainer > * {
    font-size: 30px;
}

.icons1 {
    display: flex;
    flex-flow: row;
    justify-content: space-around;
    width: 60%;
    padding: 1% 0;
}

.icons2 {
    display: flex;
    flex-flow: row;
    justify-content: space-around;
    width: 40%;
    padding: 1% 0;
    color: red;
}



.imagetitlecontainer {
    margin-top: 4rem;
    width: 100%;
    flex-wrap: wrap;
}

.imagetitlecontainer > img {
    width: 95%;
}

::-webkit-scrollbar {
    width: 0px;
    background: transparent;
    scrollbar-width: none;
}


@media only screen and (min-width: 760px) {
  .postcontainer {
    width: 70%;
  }
}
@media only screen and (min-width: 1025px) {
  .postcontainer {
    width: 40%;
  }
}

</style>