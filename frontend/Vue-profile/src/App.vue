<script setup>
import HelloWorldVue from './components/HelloWorld.vue';
import NavVue from './components/Navbar.vue';

</script>

<template>
  <div>
    <header>
      <NavVue title="Gormory"/>
    </header>
    <main>
        <HelloWorldVue/>
    </main>
    <footer class="footer p-10 bg-neutral text-neutral-content">
    <div>
      <svg height="75" width="500">
        <defs>
          <linearGradient id="grad1" x1="0%" y1="0%" x2="100%" y2="0%">
            <stop offset="0%" style="stop-color:rgb(109,235,119);stop-opacity:1" />
            <stop offset="100%" style="stop-color:rgb(10,111,10);stop-opacity:1" />
          </linearGradient>
        </defs>
        <ellipse cx="50" cy="25" rx="20" ry="20" fill="url(#grad1)" />
        <text fill="#ffffff" font-size="25" font-family="Verdana" x="90" y="35">Best Armory For Games</text>
      </svg>
      <p>Copyright © 2022 - All right reserved by David Kohalmi</p>
    </div> 
    <div>
      <span class="footer-title">Social</span> 
      <div class="grid grid-flow-col gap-4 text-2xl">
        <a href="https://github.com/killerkpoke/"><font-awesome-icon icon="fa-brands fa-github" /></a>
        <a href="https://www.linkedin.com/in/balazs-kohalmi-kpoke/"><font-awesome-icon icon="fa-brands fa-linkedin" /></a>
        <a href="https://www.facebook.com/Kohalmi.Kpoke/"><font-awesome-icon icon="fa-brands fa-facebook" /></a>
      </div>
    </div>
  </footer>
</div>
</template>

