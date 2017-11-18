function openPage(node) {

    if ($('#mytabs').tabs('exists', node.text)) {
        $('#mytabs').tabs('select', node.text);

    } else {
        $('#mytabs').tabs('add', {
            title: node.text,
            href: node.url,
            closable: true,
        });
    }
}
$('#myTree').tree({
    onClick: function (node) {
        openPage(node);
    },

    data: [{
        text: '成绩查询',
        iconCls: 'icon-student',
        url: 'student_grade_query.aspx',
    }
    ]
});
$('#myTree1').tree({
    onClick: function (node) {
        openPage(node);
    },

    data: [{
        text: '编辑自身资料',
        iconCls: 'icon-student',
        url: 's_info.aspx',
    }
    ]
});