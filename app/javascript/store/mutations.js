import Vue from 'vue'
import {
	LOG_OUT,
	LOG_IN,
	TOGGLE_ALERT,
	TOGGLE_SPINNER,
	TOGGLE_TOAST,
} from './mutation-types'

export const uiMutations = {
	[TOGGLE_ALERT](state, payload) {
		state.ui.showAlert = payload.show
		state.ui.alertMessage = payload.message
	},
	[TOGGLE_SPINNER](state, payload) {
		state.ui.showSpinner = payload
	},
	[TOGGLE_TOAST](state, payload) {
		state.ui.showToast = payload.show
		state.ui.toastMessage = payload.message
	},
	[LOG_OUT](state) {
		state.ui.isLoggedIn = false
	},
	[LOG_IN](state) {
		state.ui.isLoggedIn = true
	},
}
