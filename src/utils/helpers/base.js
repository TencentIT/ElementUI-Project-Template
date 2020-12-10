export default {
	name: 'helpers',
	/**
	* key mirror
	* @param {Object} obj 对象
	* @return {Object}
	*/
	keyMirror(obj) {
		let ret = {}
		let key

		for (key in obj) {
			if (!obj.hasOwnProperty(key)) {
				continue
			}
			ret[key] = key
		}
		return ret
	},
}