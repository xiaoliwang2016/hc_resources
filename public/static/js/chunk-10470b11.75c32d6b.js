(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["chunk-10470b11"],{"12de":function(e,t,a){"use strict";a.d(t,"c",function(){return n}),a.d(t,"a",function(){return o}),a.d(t,"b",function(){return i});var r=a("b775");function n(e){return Object(r["a"])({url:"/admin/theme/list",method:"get",params:e})}function o(e){return Object(r["a"])({url:"/admin/theme/addOrUpdate",method:"post",data:e})}function i(e){return Object(r["a"])({url:"/admin/theme/homeInfo",method:"get",params:e})}},"935b":function(e,t,a){"use strict";var r=a("eaf3"),n=a.n(r);n.a},"9a2e":function(e,t,a){"use strict";a.r(t);var r=function(){var e=this,t=e.$createElement,a=e._self._c||t;return a("div",{staticClass:"container"},[a("div",{staticClass:"header"},[a("el-button",{attrs:{size:"small"},on:{click:function(){e.showDialog(1)}}},[e._v("添加租户")])],1),e._v(" "),a("el-table",{staticStyle:{width:"100%"},attrs:{data:e.themeList,"cell-class-name":"cell"}},[a("el-table-column",{attrs:{prop:"id",width:"80",label:"租户ID"}}),e._v(" "),a("el-table-column",{attrs:{prop:"theme_name",label:"租户名称"}}),e._v(" "),a("el-table-column",{attrs:{prop:"department",label:"部门"}}),e._v(" "),a("el-table-column",{attrs:{prop:"manager",label:"创建者"}}),e._v(" "),a("el-table-column",{attrs:{prop:"status",width:"80px",label:"是否启用"},scopedSlots:e._u([{key:"default",fn:function(e){return[a("el-switch",{attrs:{value:1==e.row.status,"active-color":"#13ce66","inactive-color":"#ff4949"}})]}}])}),e._v(" "),a("el-table-column",{attrs:{prop:"update_time",label:"创建时间"},scopedSlots:e._u([{key:"default",fn:function(t){return[e._v("\n                "+e._s(e.parseTime(t.row.update_time,"{y}-{m}-{d}"))+"\n            ")]}}])}),e._v(" "),a("el-table-column",{attrs:{label:"操作"},scopedSlots:e._u([{key:"default",fn:function(t){return[a("el-button",{attrs:{type:"primary",size:"mini"},on:{click:function(){return e.showDialog(2,t.row)}}},[e._v("\n                    编辑\n                ")])]}}])})],1),e._v(" "),a("el-dialog",{attrs:{title:e.formTitle,visible:e.dialogFormVisible,width:"400px"},on:{"update:visible":function(t){e.dialogFormVisible=t}}},[a("el-form",{ref:"themeForm",attrs:{model:e.themeForm,"label-width":"100px",width:"240px"}},[a("el-form-item",{attrs:{label:"员工工号"}},[a("el-row",{attrs:{type:"flex",justify:"space-between"}},[a("el-col",{attrs:{span:14}},[a("el-input",{attrs:{disabled:e.existed},model:{value:e.themeForm.manager_id,callback:function(t){e.$set(e.themeForm,"manager_id",t)},expression:"themeForm.manager_id"}})],1),e._v(" "),a("el-col",{attrs:{span:3}},[a("el-button",{attrs:{type:"text",disabled:e.existed},on:{click:e.search}},[e._v("搜索")])],1),e._v(" "),a("el-col",{attrs:{span:3}},[a("el-button",{attrs:{type:"text",disabled:"edit"==e.operation},on:{click:e.clear}},[e._v("清空")])],1)],1)],1),e._v(" "),a("el-form-item",{attrs:{label:"租户名称"}},[a("el-input",{attrs:{width:"120"},model:{value:e.themeForm.theme_name,callback:function(t){e.$set(e.themeForm,"theme_name",t)},expression:"themeForm.theme_name"}})],1),e._v(" "),a("el-form-item",{attrs:{label:"管理员名称"}},[a("el-input",{attrs:{width:"120",disabled:""},model:{value:e.themeForm.manager,callback:function(t){e.$set(e.themeForm,"manager",t)},expression:"themeForm.manager"}})],1),e._v(" "),a("el-form-item",{attrs:{label:"所属部门"}},[a("el-input",{attrs:{width:"120",disabled:""},model:{value:e.themeForm.department,callback:function(t){e.$set(e.themeForm,"department",t)},expression:"themeForm.department"}})],1),e._v(" "),a("el-form-item",{attrs:{label:"租户描述"}},[a("el-input",{attrs:{resize:"none"},model:{value:e.themeForm.remark,callback:function(t){e.$set(e.themeForm,"remark",t)},expression:"themeForm.remark"}})],1)],1),e._v(" "),a("div",{staticClass:"dialog-footer",attrs:{slot:"footer"},slot:"footer"},[a("el-button",{on:{click:function(t){e.dialogFormVisible=!1}}},[e._v("取 消")]),e._v(" "),a("el-button",{attrs:{type:"primary",disabled:!(e.existed&&e.themeForm.theme_name)},on:{click:function(){e.submitForm("themeForm")}}},[e._v("保 存")])],1)],1)],1)},n=[],o=a("db72"),i=a("12de"),s=a("c24f"),l=a("ed08"),m={data:function(){return{themeList:[],dialogFormVisible:!1,themeForm:{},formTitle:"",existed:!1,operation:""}},mounted:function(){this.render()},methods:{parseTime:l["d"],render:function(){var e=this;i["c"]({pageNo:1,pageSize:10}).then(function(t){e.themeList=t.data.rows})},showDialog:function(e,t){1==e?(this.dialogFormVisible=!0,this.formTitle="新增租户",this.operation="create",this.clear()):2==e&&(this.formTitle="编辑租户",this.operation="edit",this.existed=!1,this.themeForm=Object(o["a"])({},t),this.dialogFormVisible=!0)},submitForm:function(e){var t=this;this.loading=this.$loading(),"create"==this.operation?i["a"](this.themeForm).then(function(e){t.dialogFormVisible=!1,t.render(),t.$message({message:"租户创建成功",type:"success"}),t.loading.close()}).catch(function(){t.loading.close()}):"edit"==this.operation&&i["a"](this.themeForm).then(function(e){t.dialogFormVisible=!1,t.render(),t.$message({message:"员工信息更新成功",type:"success"}),t.loading.close()}).catch(function(e){t.loading.close()})},search:function(){var e=this;Object(s["f"])({user_no:this.themeForm.manager_id}).then(function(t){var a=t.data;a?(e.existed=!0,e.themeForm.manager=a.SNAME?a.SNAME:"佚名",e.themeForm.department=a.ZZ_SIJI_DESC?a.ZZ_SIJI_DESC:"未知"):e.$message({message:"系统中找不到该用户",type:"warning"})})},clear:function(){this.existed=!1,this.themeForm={theme_name:"",department:"",manager_id:"",manager:""}}}},c=m,u=(a("935b"),a("2877")),d=Object(u["a"])(c,r,n,!1,null,null,null);t["default"]=d.exports},c24f:function(e,t,a){"use strict";a.d(t,"e",function(){return n}),a.d(t,"a",function(){return o}),a.d(t,"g",function(){return i}),a.d(t,"b",function(){return s}),a.d(t,"c",function(){return l}),a.d(t,"d",function(){return m}),a.d(t,"f",function(){return c});var r=a("b775");function n(e){return Object(r["a"])({url:"/admin/user/list",method:"get",params:e})}function o(e){return Object(r["a"])({url:"/admin/user/add",method:"post",data:e})}function i(e){return Object(r["a"])({url:"/admin/user/update",method:"post",data:e})}function s(e){return Object(r["a"])({url:"/admin/user/listResources",method:"get",params:e})}function l(e){return Object(r["a"])({url:"/admin/user/listRole",method:"get",params:e})}function m(e){return Object(r["a"])({url:"/home/user/listTheme",method:"get",params:e})}function c(e){return Object(r["a"])({url:"/admin/employee/search",method:"get",params:e})}},eaf3:function(e,t,a){}}]);