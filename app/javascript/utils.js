import config from './config.js'
import store from './store'

export function goBack() {
  this.$router.go(-1)
}

export function axiosConfig() {
  return {
    headers: {
      'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8'
    }
  }
}

export function axiosConfigAuth() {
  return {
    headers: {
      'Authorization': 'Bearer ' + store.state.user.access_token
    }
  }
}

export function getFromStorageArr(name) {
  if (localStorage.getItem(name)) {
    return JSON.parse(CryptoJS.AES.decrypt(localStorage.getItem(name).toString(), config.token).toString(CryptoJS.enc.Utf8))
  }
  return []
}
export function getFromStorageObj(name) {
  if (localStorage.getItem(name)) {
    return JSON.parse(CryptoJS.AES.decrypt(localStorage.getItem(name).toString(), config.token).toString(CryptoJS.enc.Utf8))
  }
  return {}
}

export function getFromStorage(name) {
  if (localStorage.getItem(name)) {
    return CryptoJS.AES.decrypt(localStorage.getItem(name).toString(), config.token).toString(CryptoJS.enc.Utf8)
  }
  return null
}

export function setToStorageJSON(name, value) {
  localStorage.setItem(name, CryptoJS.AES.encrypt(JSON.stringify(value), config.token))
}

export function setToStorage(name, value) {
  localStorage.setItem(name, CryptoJS.AES.encrypt(value, config.token))
}

export const URL = {
}
