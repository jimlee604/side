var book = new Object()

function update() {
    var name = document.getElementById('namefield').value;
    var num = document.getElementById('numfield').value;
    if (book[name] === undefined)
    {
        document.getElementById('list').innerHTML
            += name + ' | ' + num + '<br>';
        book[name] = num;
    } else {
        book[name] = num;
        var newlist = ''
        for (key in book) {
            if (book[key] !== undefined)
                newlist += key + ' | ' + book[key] + '<br>';
        }
        document.getElementById('list').innerHTML = newlist;
    }
}

function remove1() {
    var name = document.getElementById('namefield').value;
    book[name] = undefined;
    var newlist = ''
    for (key in book) {
        if (book[key] !== undefined)
                newlist += key + ' | ' + book[key] + '<br>';
    }
    document.getElementById('list').innerHTML = newlist;
}