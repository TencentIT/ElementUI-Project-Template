<template>
  <div class="container-box">
    <el-button type="warning" icon="el-icon-star-off" circle @click="saveDialog = true"></el-button>
    <el-button type="primary" icon="el-icon-download" circle></el-button>
    <el-button type="text" style="float:right" @click="drawer = true">filter</el-button>
    <el-row type="flex" class="row-bg" justify="center" style="margin-top:10px">
      <el-col :span="24">
        <el-table :data="tableData" style="width: 100%" empty-text="No Data Found">
          <el-table-column prop="SN" label="SN" width="180"></el-table-column>
          <el-table-column prop="Status" label="Status" width="180"></el-table-column>
          <el-table-column prop="Model" label="Model"></el-table-column>
          <el-table-column prop="ResellerName" label="Reseller Name"></el-table-column>
          <el-table-column prop="MerchantName" label="Merchant Name"></el-table-column>
          <el-table-column prop="ApplicationName" label="Application Name"></el-table-column>
          <el-table-column prop="ApplicationName" label="Application Version"></el-table-column>
          <el-table-column prop="ApplicationName" label="Application PublishDate"></el-table-column>
        </el-table>
      </el-col>
    </el-row>
    <el-dialog title="Save to my report" :visible.sync="saveDialog" width="30%"> 
      <el-input placeholder="Report name" v-model="SavingReportName" clearable></el-input>
      <span slot="footer" class="dialog-footer">
        <el-button @click="dialogVisible = false">Cancel</el-button>
        <el-button type="primary" @click="dialogVisible = false">Save</el-button>
      </span>
    </el-dialog>
    <el-drawer title="Filters" :visible.sync="drawer" direction="rtl" size="20%">
      <div></div>
    </el-drawer>
  </div>
</template>

<script>
import { getTableData } from "@/proxy/processorInfo.js";
export default {
  data() {
    return {
      tableData: [],
      saveDialog: false,
      SavingReportName: "",
      drawer: false
    };
  },
  async created() {
    //result = await getTableData();
    // tableData = result.data;
  },
  methods: {}
};
</script>

<style lang='scss' scoped>
</style>