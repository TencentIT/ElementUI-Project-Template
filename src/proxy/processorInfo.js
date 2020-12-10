import axios from '../http.js'
const getData = '/processorInfo/getTableData'
const getTableData = function (filter) {
  axios({
    method: 'get',
    url: getData,
    data: filter
  })
}
export {
  getTableData
}
