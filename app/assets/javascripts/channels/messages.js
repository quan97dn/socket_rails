App.messages = App.cable.subscriptions.create('MessagesChannel', {
  received: function(data) {
    html = "";
    obj = data.list;
    obj.forEach(function(entry) {
      html += "<tr>";
      html += "<td>" + entry.id + "</td>";
      html += "<td>" + entry.product_id + "</td>";
      html += "<td>" + entry.timer + "</td>";
      html += "</tr>";
    });
    $('#loadlist').html(html);
  }
});
