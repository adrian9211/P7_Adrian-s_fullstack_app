<template>
    <footer>
        <h5>{{ copyright }}</h5>
    </footer>
</template>

<script>
export default {
    name: 'Footer',
    data() {
        return {
            companyName: 'Groupomania',
            developed: 'developed by Adrian Nykiel'
        }
    },
    computed: {
        copyright() {
            const currentYear = new Date().getFullYear()
            return `Copyright ${this.companyName} ${currentYear} ${this.developed}`
        }
    }
}
</script>

<style>

footer {
    background: rgb(0,122,184);
}

h5 {
    font-style: italic;
    text-align: center;
    color: white;
}

@media only screen and (min-width: 460px) and (max-width: 1024px) {
    footer > h5 {
        font-size: 1.3em;
    }
}

</style>