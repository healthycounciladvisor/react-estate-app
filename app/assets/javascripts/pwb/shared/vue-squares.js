var INMOAPP = INMOAPP || {};


window.onload = function() {

  var pwbSS = Vue.component('social-sharing', SocialSharing);
  // var pwbGM = Vue.component('gmap-map', VueGoogleMaps);
  Vue.use(VueGoogleMaps, {
    load: {
      key: 'AIzaSyCPorm8YzIaUGhKfe5cvpgofZ_gdT8hdZw'
      // v: '3.26', // Google Maps API version
      // libraries: 'places',   // If you want to use places input
    }
  });
  // var VueMaterial = Vue.component('vue-material');
  Vue.use(VueMaterial);
  // Vue.use(VueMaterial.mdCore) //Required to boot vue material
  // Vue.use(VueMaterial.mdButton)
  // Vue.use(VueMaterial.mdIcon)
  // Vue.use(VueMaterial.mdSidenav)
  // Vue.use(VueMaterial.mdToolbar)

  var markers = INMOAPP.markers || [];
  INMOAPP.pwbVue = new Vue({
    el: '#squares-vue',
    data: {},
    methods: {
      toggleLeftSidenav() {
        this.$refs.leftSidenav.toggle();
      },
      toggleRightSidenav() {
        this.$refs.rightSidenav.toggle();
      },
      closeRightSidenav() {
        this.$refs.rightSidenav.close();
      },
      open(ref) {
        console.log('Opened: ' + ref);
      },
      close(ref) {
        console.log('Closed: ' + ref);
      }
    }
  });

}
