<template>
    <form>

        <img src="../assets/7plQ.gif" alt="" id="loadingGif" hidden>

        <div class="uploadContainer">

            <h1>Share Your thoughts </h1>

            <div>
                <label for="name"><b>Name</b></label>
                <input @input="validateFileInput($event)" v-model="name" type="text" name="name">
            </div>
            <div>
                <label for="title"><b>Title of your subject</b></label>
                <input @input="validateFileInput($event)" v-model="title" type="text" name="title">
            </div>

            <div class="uploadfilecontainer">
                <label for="file"><b>Upload your profile photo</b></label>
                <br>
                <input accept="image/gif, image/jpeg, image/png" pattern="^.*\.(jpg|jpeg|png|gif)$" type="file" name="file" @change="validateFileInput($event), previewFile($event)">
                <img id="imagepreview" />
            </div>

            <button type="submit" @click.prevent="uploadFile($event)" disabled>Upload</button>
        </div>
    </form>
</template>

<script>
import axios from 'axios';

export default {
    name: 'addPost',
    data () {
        return {
            userDetails: [],
            userId: sessionStorage.getItem('userId'),
            name: '',
            title: '',
            file: '',
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
        previewFile ($event) {
            this.file = $event.target.files[0]
            if (this.file instanceof Blob) {
                let reader = new FileReader();
                reader.onload = function ($event) {
                    document.getElementById("imagepreview").src = $event.target.result;
                }
                reader.readAsDataURL(this.file);
            } else {
                document.getElementById("imagepreview").src = '';
            }
        },
       uploadFile() {
            document.getElementsByClassName('uploadContainer')[0].style.display = 'none'
            document.getElementById('loadingGif').removeAttribute('hidden')
            let formData = new FormData();
            formData.append('file', this.file)
            formData.append('userId', this.userId)
            formData.append('title', this.title)
            formData.append('name', this.name)
            axios.post('http://localhost:3000/api/post', formData,
            { headers:
                {
                'Authorization': `Bearer ${sessionStorage.getItem('token')}`,
                'Content-Type': 'multipart/form-data' 
                }
            }).then((response) => {
                if (response.data.status === '201') {
                    this.$router.push('/postlist')
                } else if (response.data.status === '401') {
                    alert(response.data.message)
                    this.$store.commit('logout')
                } else {
                    document.getElementById('loadingGif').setAttribute('hidden', true);
                    document.getElementsByClassName('uploadContainer')[0].style.display = 'initial'
                    alert(response.data.message)
                }
            }).catch((err => {
                document.getElementById('loadingGif').setAttribute('hidden', true);
                document.getElementsByClassName('uploadContainer')[0].style.display = 'initial'
                alert(err)
            }))
        },
        validateFileInput() {
                let inputElement = document.querySelectorAll('input');
                let submitButton = document.getElementsByTagName('button')[0];
                for (let i = 0; i < inputElement.length; i++) {
                if (inputElement[0].value.length >= 1 && inputElement[1].value.match(inputElement[1].pattern)) {
                    submitButton.removeAttribute('disabled');
                } else {
                    submitButton.setAttribute('disabled', true)
                }
            }
        }
    }
}
</script>

<style>

#imagepreview {
    padding: 5% 0 0 0;
}
.uploadContainer {
    display: flex;
    flex-flow: column;
    margin: 0 0 5% 0;
    width: 90%;
}
.uploadfilecontainer {
    margin: 5% 0;
    display: flex;
    align-items: center;
  justify-content: center;
    flex-flow: column;
}

.uploadfilecontainer > img {
    
    width: 25%;
}

.uploadfilecontainer > button {
    margin: 5% 0;
    display: flex;
    align-items: center;
    justify-content: center;
    flex-flow: column;
    width: 15rem;
}

input[type=file] {
    margin: 3% 0 0 0;
}
@media only screen and (min-width: 461px) {
    .uploadContainer {
        width: 60%;
    }
}
@media only screen and (min-width: 1025px) {
    .uploadContainer {
        width: 40%;
    }
}
</style>