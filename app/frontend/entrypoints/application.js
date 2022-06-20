// To see this message, add the following to the `<head>` section in your
// views/layouts/application.html.erb
//
//    <%= vite_client_tag %>
//    <%= vite_javascript_tag 'application' %>

// If using a TypeScript entrypoint file:
//     <%= vite_typescript_tag 'application' %>
//
// If you want to use .jsx or .tsx, add the extension:
//     <%= vite_javascript_tag 'application.jsx' %>

// console.log('Visit the guide for more information: ', 'https://vite-ruby.netlify.app/guide/rails')

// Example: Load Rails libraries in Vite.
//
// import * as Turbo from '@hotwired/turbo'
// Turbo.start()
//
// import ActiveStorage from '@rails/activestorage'
// ActiveStorage.start()
//
// // Import all channels.
// const channels = import.meta.globEager('./**/*_channel.js')

// Example: Import a stylesheet in app/frontend/index.css
// import '~/index.css'

// import '~/styles/background.css'
import { createApp } from 'vue'
import App from '~/v-admin-app/src/App.vue'
import { Quasar } from 'quasar'

// Import icon libraries
import '@quasar/extras/material-icons/material-icons.css'

// Import Quasar css
import 'quasar/src/css/index.sass'

// import { Component, createApp } from 'vue'
// import { Router } from 'vue-router'
import { createRouter, createWebHistory } from 'vue-router'
// import { VueQueryPlugin } from 'vue-query'
// import { globalProperties } from './globalProperties'
// import { pinia } from '@/stores'
// import { setHTTPHeader } from '@/services/http.service'
// import AuthService from '@/services/auth.service'

// 1. Define route components.
// These can be imported from other files
// const About = { template: '<div>About</div>' }

// 2. Define some routes
// Each route should map to a component.
// We'll talk about nested routes later.
const routes = [
  {
    path: '/', component: () => import("../v-admin-app/src/components/AdminIntro.vue"),
  },
  // { path: '/about', component: About },
]

// 3. Create the router instance and pass the `routes` option
// You can pass in additional options here, but let's
// keep it simple for now.
const router = createRouter({
  // 4. Provide the history implementation to use. We are using the hash history for simplicity here.
  history: createWebHistory('/v-admin/'),
  routes, // short for `routes: routes`
})



const myApp = createApp(App)

myApp.use(Quasar, {
  plugins: {}, // import Quasar plugins and add here
})

myApp.use(router)
// myApp.use(pinia)
// myApp.use(VueQueryPlugin)
// myApp.config.globalProperties = globalProperties

myApp.mount('#app')

// console.log('Vite ⚡️ Rails 7')