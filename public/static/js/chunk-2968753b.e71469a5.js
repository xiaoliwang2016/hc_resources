(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["chunk-2968753b"],{"12de":function(e,t,i){"use strict";i.d(t,"c",function(){return n}),i.d(t,"a",function(){return r}),i.d(t,"b",function(){return a});var s=i("b775");function n(e){return Object(s["a"])({url:"/admin/theme/list",method:"get",params:e})}function r(e){return Object(s["a"])({url:"/admin/theme/addOrUpdate",method:"post",data:e})}function a(e){return Object(s["a"])({url:"/admin/theme/homeInfo",method:"get",params:e})}},5573:function(e,t,i){},"63e8":function(e,t,i){"use strict";i.d(t,"e",function(){return n}),i.d(t,"a",function(){return r}),i.d(t,"d",function(){return a}),i.d(t,"b",function(){return o}),i.d(t,"c",function(){return c});var s=i("b775");function n(e){return Object(s["a"])({url:"/admin/resources/list",method:"get",params:e})}function r(e){return Object(s["a"])({url:"/admin/resources/addOrUpdate",method:"post",data:e})}function a(e){return Object(s["a"])({url:"/admin/resources/delete",method:"post",data:e})}function o(e){return Object(s["a"])({url:"/admin/resources/assignToRole",method:"post",data:e})}function c(e){return Object(s["a"])({url:"/admin/resources/assignToUser",method:"post",data:e})}},"7b30":function(e,t,i){"use strict";i.r(t);var s=function(){var e=this,t=e.$createElement,i=e._self._c||t;return i("el-container",[i("el-header",{staticClass:"tips",attrs:{height:"50px"}},[i("b",[e._v("温馨提示!")]),e._v(" 本模块功能配置主题门户首页和左侧菜单；菜单深度为3.")]),e._v(" "),i("el-main",[i("div",{staticClass:"block"},[i("div",{staticClass:"row tree-head"},[i("span",{staticClass:"title title_0"},[e._v("菜单名称")]),e._v(" "),i("span",{staticClass:"grid"},[e._v("菜单类型")]),e._v(" "),i("span",{staticClass:"grid"},[e._v("启用")]),e._v(" "),i("span",{staticClass:"grid"},[e._v("公开")]),e._v(" "),i("span",{staticClass:"grid"},[e._v("系统来源")])]),e._v(" "),i("div",{staticClass:"row home"},[i("span",{staticClass:"title title_0"},[e._v("首页")]),e._v(" "),i("span",{staticClass:"grid"},[e._v("首页")]),e._v(" "),i("span",{staticClass:"grid"},[i("el-switch",{attrs:{disabled:!0,value:!0}})],1),e._v(" "),i("span",{staticClass:"grid"},[i("el-switch",{attrs:{disabled:!0,model:!0}})],1),e._v(" "),i("span",{staticClass:"grid",staticStyle:{"margin-right":"6px"}}),e._v(" "),i("span",{staticClass:"btn-group",staticStyle:{"text-align":"left"}},[i("el-button",{directives:[{name:"identify",rawName:"v-identify",value:{name:"add_resources_2"},expression:"{name: 'add_resources_2'}"}],attrs:{type:"success",size:"mini"},on:{click:function(){return e.createResources({type:0,id:0})}}},[e._v("\n\t\t\t\t\t\t创建一级菜单\n\t\t\t\t\t")]),e._v(" "),i("el-button",{directives:[{name:"identify",rawName:"v-identify",value:{name:"add_resources_2"},expression:"{name: 'add_resources_2'}"}],attrs:{type:"primary",size:"mini"},on:{click:e.toEditHome}},[e._v("\n\t\t\t\t\t\t编辑\n\t\t\t\t\t")])],1)]),e._v(" "),i("el-tree",{attrs:{data:e.resourcesList,"node-key":"id","default-expand-all":"",draggable:!0,"expand-on-click-node":!1,"allow-drop":function(e,t,i){return e.data.pid==t.data.pid&&("prev"==i||"next"==i)},indent:24},on:{"node-drag-end":e.dragEndHandler},scopedSlots:e._u([{key:"default",fn:function(t){t.node;var s=t.data;return i("span",{staticClass:"row"},[i("span",{class:["title","title_"+s.type]},[e._v(e._s(s.menu_title))]),e._v(" "),i("span",{staticClass:"grid"},[1==s.type?[e._v("一级菜单")]:2==s.type?[e._v("二级菜单")]:[e._v("三级菜单")]],2),e._v(" "),i("span",{staticClass:"grid"},[i("el-switch",{directives:[{name:"identify",rawName:"v-identify",value:{name:"edit_resources"},expression:"{name: 'edit_resources'}"}],attrs:{"active-value":1,"inactive-value":0},on:{change:function(t){return e.switchChangeHandler(s,t,"status")}},model:{value:s.status,callback:function(t){e.$set(s,"status",t)},expression:"data.status"}})],1),e._v(" "),i("span",{staticClass:"grid"},[i("el-switch",{directives:[{name:"identify",rawName:"v-identify",value:{name:"edit_resources"},expression:"{name: 'edit_resources'}"}],attrs:{"active-value":1,"inactive-value":0},on:{change:function(t){return e.switchChangeHandler(s,t,"public")}},model:{value:s.public,callback:function(t){e.$set(s,"public",t)},expression:"data.public"}})],1),e._v(" "),i("span",{staticClass:"grid"},[e._v(e._s(s.origin))]),e._v(" "),i("span",{staticClass:"btn-group"},[1==s.type?i("el-button",{directives:[{name:"identify",rawName:"v-identify",value:{name:"add_resources_2"},expression:"{name: 'add_resources_2'}"}],attrs:{type:"success",size:"mini"},on:{click:function(){return e.createResources(s)}}},[e._v("\n\t\t\t\t\t\t\t创建二级菜单\n\t\t\t\t\t\t")]):e._e(),e._v(" "),2==s.type?i("el-button",{directives:[{name:"identify",rawName:"v-identify",value:{name:"add_resources_3"},expression:"{name: 'add_resources_3'}"}],attrs:{type:"success",size:"mini"},on:{click:function(){return e.createResources(s)}}},[e._v("\n\t\t\t\t\t\t\t创建三级菜单\n\t\t\t\t\t\t")]):e._e(),e._v(" "),i("el-button",{directives:[{name:"identify",rawName:"v-identify",value:{name:"edit_resources"},expression:"{name: 'edit_resources'}"}],attrs:{type:"primary",size:"mini"},on:{click:function(){return e.editResources(s)}}},[e._v("\n\t\t\t\t\t\t\t编辑\n\t\t\t\t\t\t")]),e._v(" "),i("el-button",{directives:[{name:"identify",rawName:"v-identify",value:{name:"delete_resources"},expression:"{name: 'delete_resources'}"}],attrs:{type:"warning",size:"mini"},on:{click:function(){return e.deleteResources(s)}}},[e._v("\n\t\t\t\t\t\t\t删除\n\t\t\t\t\t\t")])],1)])}}])})],1),e._v(" "),i("el-dialog",{attrs:{title:e.layerTitle,visible:e.dialogVisible,width:"1200px","before-close":e.handleClose},on:{"update:visible":function(t){e.dialogVisible=t}}},[i("el-form",{ref:"resourcesForm",staticClass:"form demo-ruleForm",attrs:{model:e.resourcesForm,"label-width":"80px"}},[i("el-form-item",{attrs:{label:"菜单标题"}},[i("el-col",{attrs:{span:12}},[i("el-input",{attrs:{type:"text",placeholder:"请输入菜单标题",maxlength:"8","show-word-limit":""},model:{value:e.resourcesForm.menu_title,callback:function(t){e.$set(e.resourcesForm,"menu_title",t)},expression:"resourcesForm.menu_title"}})],1)],1),e._v(" "),i("el-form-item",{attrs:{label:"打开方式"}},[i("el-select",{attrs:{placeholder:"请选择打开方式",disabled:3!=e.resourcesForm.type},model:{value:e.resourcesForm.open_type,callback:function(t){e.$set(e.resourcesForm,"open_type",t)},expression:"resourcesForm.open_type"}},[i("el-option",{attrs:{label:"当前窗口",value:0}}),e._v(" "),i("el-option",{attrs:{label:"新窗口",value:1}})],1)],1),e._v(" "),e._l(e.resourcesForm.links,function(t,s){return i("el-form-item",{directives:[{name:"show",rawName:"v-show",value:3==e.resourcesForm.type||0==e.resourcesForm.type,expression:"resourcesForm.type == 3 || resourcesForm.type == 0"}],key:s,attrs:{label:"链接地址",inline:!0}},[i("el-row",{attrs:{type:"flex",justify:"space-between"}},[i("el-col",{attrs:{span:10}},[i("el-input",{attrs:{placeholder:"请输入地址"},model:{value:t.url,callback:function(i){e.$set(t,"url",i)},expression:"link.url"}},[i("template",{slot:"prepend"},[e._v("Http://")])],2)],1),e._v(" "),i("el-col",{attrs:{span:4}},[i("el-select",{attrs:{placeholder:"系统来源"},model:{value:t.origin,callback:function(i){e.$set(t,"origin",i)},expression:"link.origin"}},[i("el-option",{attrs:{label:"空模板",value:""}}),e._v(" "),i("el-option",{attrs:{label:"Tableau",value:"Tableau"}})],1)],1),e._v(" "),i("el-col",{attrs:{span:7}},[i("el-switch",{attrs:{disabled:""==t.origin,"active-value":1,"inactive-value":0,"active-text":"登录","inactive-text":"免登录"},model:{value:t.verify,callback:function(i){e.$set(t,"verify",i)},expression:"link.verify"}}),e._v(" "),i("el-select",{staticStyle:{width:"180px"},attrs:{disabled:!t.verify,placeholder:"登录账号"},on:{change:function(t){e.changeVerifyStatus(t,s)}},model:{value:t.verify_account,callback:function(i){e.$set(t,"verify_account",i)},expression:"link.verify_account"}},[e._l(e.accountList,function(e){return i("el-option",{key:e.account,attrs:{label:e.account,value:e.account}})}),e._v(" "),i("el-option",{attrs:{label:"新建账号",value:0}})],2)],1),e._v(" "),i("el-col",{attrs:{span:1.5}},[i("el-button",{attrs:{disabled:!t.url,icon:"el-icon-plus",circle:""},on:{click:e.addLink}}),e._v(" "),0!=s?i("el-button",{attrs:{icon:"el-icon-delete",circle:""},on:{click:function(){e.resourcesForm.links.splice(s,1)}}}):e._e()],1)],1)],1)}),e._v(" "),i("el-form-item",{attrs:{label:"公开"}},[i("el-switch",{attrs:{"active-value":1,"inactive-value":0},model:{value:e.resourcesForm.public,callback:function(t){e.$set(e.resourcesForm,"public",t)},expression:"resourcesForm.public"}})],1),e._v(" "),i("el-form-item",[i("el-button",{attrs:{type:"primary"},on:{click:function(t){return e.submitForm()}}},[e._v("保存")]),e._v(" "),i("el-button",{on:{click:function(){e.dialogVisible=!1}}},[e._v("取消")])],1)],2),e._v(" "),i("el-dialog",{attrs:{width:"30%",title:"请登录",visible:e.innerVisible,"append-to-body":""},on:{"update:visible":function(t){e.innerVisible=t}}},[i("el-form",{attrs:{"label-width":"80px"}},[i("el-form-item",{attrs:{label:"用户名"}},[i("el-input",{model:{value:e.accountForm.account,callback:function(t){e.$set(e.accountForm,"account",t)},expression:"accountForm.account"}})],1),e._v(" "),i("el-form-item",{attrs:{label:"密码"}},[i("el-input",{model:{value:e.accountForm.password,callback:function(t){e.$set(e.accountForm,"password",t)},expression:"accountForm.password"}})],1),e._v(" "),i("el-form-item",[i("el-button",{attrs:{type:"primary",size:"small"},on:{click:e.verifyAccount}},[e._v("登录")]),e._v(" "),i("el-button",{attrs:{size:"small"},on:{click:function(){e.innerVisible=!1}}},[e._v("取消")])],1)],1)],1)],1)],1),e._v(" "),i("el-footer",{attrs:{height:"50px"}})],1)},n=[],r=i("63e8"),a=i("b775");function o(e){return Object(a["a"])({url:"/admin/account/save",method:"post",data:e})}function c(e){return Object(a["a"])({url:"/admin/account/list",method:"get",params:e})}var l=i("12de"),u=i("ed08"),d=i("986e"),m={name:"Configuration",data:function(){return{dialogVisible:!1,innerVisible:!1,layerTitle:"编辑菜单",resourcesList:[],resourcesForm:{},accountList:[],accountForm:{}}},mounted:function(){var e=this;this.init(),this.render(),d["a"].$on("change-theme",function(){e.init(),e.render()})},beforeDestroy:function(){d["a"].$off("change-theme")},methods:{init:function(){var e=this;c({theme_id:this.$store.state.admin.themeInfo.id}).then(function(t){e.accountList=t.data})},render:function(){var e=this;return new Promise(function(t){r["e"]({theme_id:e.$store.state.admin.themeInfo.id,tree:1}).then(function(i){e.resourcesList=i.data,t()})})},submitForm:function(){var e=this;if(3==this.resourcesForm.type){var t=this.resourcesForm.links.reduce(function(e,t){return e&&t.url},!0);if(!t)return this.$message({type:"warning",message:"请不要输入空链接"})}this.loading=this.$loading(),r["a"](this.resourcesForm).then(function(t){e.dialogVisible=!1,e.render().then(function(){e.$message({message:"操作成功",type:"success"}),e.loading.close()})})},switchChangeHandler:function(e,t,i){if(0==t&&3!=e.type){var s=Object(u["a"])(this.resourcesList,"id",e.id);if(s.children&&s.children.length>0){var n=Object(u["a"])(s.children,i,1);if(!1!==n)return e[i]=1,this.$message({message:"尚有未关闭的子节点，请先关闭子节点",type:"warning"})}}this.resourcesForm=e,this.submitForm()},createResources:function(e){switch(this.resourcesForm={type:e.type+1,menu_title:"",open_type:0,public:0,pid:e.id,links:[{url:"",origin:"Tableau",verify:0,verify_account:""}],user_id:this.$store.state.admin.userInfo.id,theme_id:this.$store.state.admin.themeInfo.id},e.type){case 0:this.layerTitle="添加一级菜单";break;case 1:this.layerTitle=e.menu_title+"：添加二级菜单";break;case 2:this.layerTitle=e.menu_title+"：添加三级菜单";break}this.operation="create",this.dialogVisible=!0},editResources:function(e){this.layerTitle="编辑菜单："+e.menu_title,this.resourcesForm=e,this.operation="edit",this.dialogVisible=!0},deleteResources:function(e){var t=this;if(3!=e.type){var i=Object(u["a"])(this.resourcesList,"id",e.id);if(i.children&&i.children.length>0){var s=Object(u["a"])(i.children,"theme_id",this.$store.state.admin.themeInfo.id);if(!1!==s)return this.$message({message:"尚有未删除的子节点，请先删除子节点",type:"warning"})}}this.$confirm("您确定要删除该选项吗？","提示",{confirmButtonText:"删除",cancelButtonText:"取消",type:"warning"}).then(function(){r["d"]({id:e.id}).then(function(e){t.render().then(function(){t.$message({message:"菜单删除成功",type:"success"})})})})},handleClose:function(){var e=this;if(this.resourcesForm.menu_title)return this.$confirm("数据尚未保存，确定要关闭吗？").then(function(t){e.dialogVisible=!1}).catch(function(e){});this.dialogVisible=!1},dragEndHandler:function(e,t,i){this.resourcesForm=e.data,"after"==i?this.resourcesForm.resources_order=t.data.resources_order-1:"before"==i&&(this.resourcesForm.resources_order=t.data.resources_order+1),this.submitForm()},toEditHome:function(){var e=this;this.loading=this.$loading(),Object(l["b"])({theme_id:this.$store.state.admin.themeInfo.id}).then(function(t){t.data?e.resourcesForm=t.data:e.resourcesForm={type:0,menu_title:"首页",open_type:0,public:1,pid:-1,links:[{url:"",origin:"Tableau",verify:0,verify_account:""}],user_id:e.$store.state.admin.userInfo.id,theme_id:e.$store.state.admin.themeInfo.id},e.layerTitle="编辑首页",e.operation="edit",e.dialogVisible=!0,e.loading.close()})},addLink:function(){this.resourcesForm.links.push({url:"",origin:"Tableau",verify:0,verify_account:""})},changeVerifyStatus:function(e,t){0==e&&(this.accountForm={account:"",password:""},this.innerVisible=!0,this.selectIndex=t)},verifyAccount:function(){var e=this;"123"==this.accountForm.password&&(o({account:this.accountForm.account,password:this.accountForm.password,theme_id:this.$store.state.admin.themeInfo.id,admin_id:this.$store.state.admin.userInfo.id}).then(function(){c({theme_id:e.$store.state.admin.themeInfo.id}).then(function(t){e.accountList=t.data})}),this.resourcesForm.links[this.selectIndex].verify_account=this.accountForm.account,this.innerVisible=!1)}}},p=m,v=(i("c311"),i("2877")),f=Object(v["a"])(p,s,n,!1,null,null,null);t["default"]=f.exports},c311:function(e,t,i){"use strict";var s=i("5573"),n=i.n(s);n.a}}]);