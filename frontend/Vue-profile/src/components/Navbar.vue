<script>
export default {
    data() {
        return {
            logged_in: true,
        }
    },
    props:{
        title: String,
    }
}
</script>
<template>
    <div>
        <div class="navbar border rounded-xl border-green-700 bg-base-100 bg-gradient-to-t from-green-400 to-green-800">
            <div class="flex-1 ">
                <a class="btn btn-ghost capitalize px-4 normal-case text-black text-4xl">{{title}}</a>
            </div>
            <div class="flex-none gap-2">
                <div class="dropdown dropdown-end">
                <label tabindex="0" class="btn btn-ghost btn-circle avatar">
                    <div v-if="this.logged_in" class="w-10 rounded-full">
                        <img src="https://placeimg.com/80/80/people" />
                    </div>
                    <div v-else class="text-5xl text-black rounded-full">
                        <font-awesome-icon icon="fa-solid fa-user-secret" />
                    </div>
                </label>
                <ul v-if="this.logged_in" tabindex="0" class="text-white mt-3 p-2 shadow menu menu-normal dropdown-content bg-green-900 rounded-box w-52">
                    <li class="">
                        <a>
                            <font-awesome-icon icon="fa-solid fa-user" />
                            Profile
                        </a>
                    </li>
                    <li class="">
                        <a>
                            <font-awesome-icon icon="fa-solid fa-gear" />
                            Settings
                        </a>
                    </li>
                    <li class="">
                        <a>
                            <font-awesome-icon icon="fa-solid fa-right-from-bracket" />
                            Logout
                        </a>    
                    </li>
                </ul>
                <ul v-else tabindex="0" class="text-white mt-3 p-2 shadow menu menu-normal dropdown-content bg-green-900 rounded-box w-52">
                    <li class="">
                        <a>
                            <font-awesome-icon icon="fa-solid fa-user" />
                            Login
                        </a>
                    </li>
                </ul>
                </div>
            </div>
        </div>
    </div>
</template>