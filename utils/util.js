function findChild(arr, id) {
    let childs = [];
    arr.forEach(v => {
        if (v.pid == id) {
            childs.push(v);
        }
    });
    return childs;
}

const build_tree = function (arr, id) {
    let childs = findChild(arr, id);
    if (childs.length == 0) {
        return null;
    }
    childs.forEach((v, k) => {
        let buildTree = build_tree(arr, v.id);
        if (null != buildTree) {
            v['children'] = buildTree;
        }
    });
    return childs;
}

const removeDuplicateViaId = function(arr){
    var result = [];
    var obj = {};
    for(var i = 0; i < arr.length; i++){
       if(!obj[arr[i].id]){
          result.push(arr[i]);
          obj[arr[i].id] = true;
       }
    }
    return result
}

module.exports = {
    build_tree,
    removeDuplicateViaId
}