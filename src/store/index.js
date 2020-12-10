import Vue from 'vue'
import Vuex from 'vuex'
import actions from './actions'
import mutations from './mutations'

Vue.use(Vuex)

export default new Vuex.Store({
	state: {
		// 在ajax pending的数量
		breadcrumb: null,
	},
	getters: {

	},
	actions,
	mutations
})