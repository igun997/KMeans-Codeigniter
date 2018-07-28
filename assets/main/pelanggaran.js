$(document).ready(function() {
  console.log("Pelanggaran");
  table_main = $("#main").DataTable({
    order: [
      [0, "desc"]
    ],
    ajax: base_url + "api/pelanggaranread"
  });
  $("#calc").on('click', function(event) {
    event.preventDefault();
    var dialog = bootbox.dialog({
      title: 'Prepare Menu ',
      message: '<p><center><i class="fa fa-spin fa-spinner"></i> Loading...</center></p>'
    });
    dialog.init(function() {
      setTimeout(function() {
        dialog.find(".modal-title").html("");
        tbl = table(["Motor","Mobil"],[],"ups");
        dialog.find(".bootbox-body").html("<div class='row'><div class='col-md-12'>"+tbl+"</div></div>");
        dialog.find("#ups").DataTable({
          ajax:base_url + "api/kmeans"
        });
      }, 2000);
    });
  });
  $("#add").on('click', function(event) {
    event.preventDefault();
    var dialog = bootbox.dialog({
      title: 'Prepare Menu ',
      message: '<p><center><i class="fa fa-spin fa-spinner"></i> Loading...</center></p>'
    });
    dialog.init(function() {
      setTimeout(function() {
        dialog.find(".modal-title").html("");
        form = [{
          label: "Jenis Pelanggaran",
          type: "select2",
          id: "id_kp",
          name: "id_kp"
        }, {
          label: "Jumlah",
          type: "number",
          id: "jumlah",
          name: "jumlah"
        }, {
          label: "Tahun",
          type: "text",
          id: "tahun",
          name: "tahun"
        }];
        button = {
          name: "Simpan",
          class: "success",
          type: "submit"
        };
        html = builder(form, button, "up");
        dialog.find(".bootbox-body").html("<div class='row'><div class='col-md-12'>" + html + "</div></div>");
        selectbuilder([{
          value: 1,
          text: "Mobil"
        }, {
          value: 2,
          text: "Motor"
        }], dialog.find("#id_kp"));
        dialog.find("#up").on('submit', function(event) {
          event.preventDefault();
          dform = $(this).serializeArray();
          console.log(dform);
          up = post(base_url + "api/pelanggaraninsert", dform);
          if (up.status == 1) {
            swal("Sukses", "Data Sukses Di Simpan", "success");
            table_main.ajax.reload();
            bootbox.hideAll();
          } else {
            swal("Gagal", "Data Gagal Di Simpan", "error");
          }
        });
      }, 2000);
    });
  });
  $("#main").on('click', 'tbody tr', function(event) {
    event.preventDefault();
    data = table_main.row(this).data();
    console.log(data);
    var dialog = bootbox.dialog({
      title: 'Prepare Menu ',
      message: '<p><center><i class="fa fa-spin fa-spinner"></i> Loading...</center></p>'
    });
    dialog.init(function() {
      setTimeout(function() {
        dialog.find(".modal-title").html("");
        form = [{
          label: "Jenis Pelanggaran",
          type: "select2",
          id: "id_kp",
          name: "id_kp"
        }, {
          label: "Jumlah",
          type: "number",
          id: "jumlah",
          name: "jumlah",
          value: data[2]
        }, {
          label: "Tahun",
          type: "text",
          id: "tahun",
          name: "tahun",
          value: data[3]
        }, {
          label: "",
          type: "hidden",
          name: "id_pelanggaran",
          value: data[0]
        }];
        button = {
          name: "Ubah",
          class: "warning",
          type: "submit"
        };
        html = builder(form, button, "up");
        dialog.find(".bootbox-body").html("<div class='row'><div class='col-md-12'>" + html + "</div></div>");
        id = 1;
        name = "Mobil";
        if (data[1] != "Mobil") {
          id = 2;
          name = "Motor";
        }
        selectbuilder([{
          value: 1,
          text: "Mobil"
        }, {
          value: 2,
          text: "Motor"
        }], dialog.find("#id_kp"), [{
          value: id,
          text: name
        }]);

        dialog.find("#up").on('submit', function(event) {
          event.preventDefault();
          dform = $(this).serializeArray();
          console.log(dform);
          up = post(base_url + "api/pelanggaranupdate", dform);
          if (up.status == 1) {
            swal("Sukses", "Data Sukses Di Update", "success");
            table_main.ajax.reload();
            bootbox.hideAll();
          } else {
            swal("Gagal", "Data Gagal Di Update", "error");
          }
        });
      }, 2000);
    });
  });
});
