<?php
defined('BASEPATH') or exit('No direct script access allowed');
require APPPATH . 'libraries/REST_Controller.php';
require_once('./vendor/autoload.php');
use Phpml\Clustering\KMeans;
/**
 	 * API Restfull
 	 * @author Indra Gunanda
	 */

class Api extends REST_Controller
{
    /**
 	 * Konstruktor
 	 * Konstruktor Berisi, pemuatan model "crud/main" dan "admin/car"  serta limitasi pengguna hanya untuk hak akses "admin"
 	 * @return json
	 */

    public function __construct()
    {
        parent::__construct();
        $this->load->model("crud/main");
    }
    /**
 	 * Initial Method
 	 *
 	 * @return json
	 */

    public function index_post()
    {
        $this->response([], 404);
    }
    /**
   * Initial Method
   *
   * @return json
   */
    public function index_get()
    {
        $this->response([], 404);
    }
    /**
   * Initial Method
   *
   * @return json
   */
    public function index_put()
    {
        $this->response([], 404);
    }
    /**
   * Initial Method
   *
   * @return json
   */
    public function index_delete()
    {
        $this->response([], 404);
    }
    /**
 	 * Get Car
 	 * Memuat data Tracking Mobil
 	 * @return json
	 */
   public function pelanggaraninsert_post()
   {
     $dpost = $this->input->post(null,true);
     $this->main->setTable("tbl_pelanggaran");
     $ins = $this->main->insert($dpost);
     if ($ins) {
       $this->response(["status"=>1]);
     }else{
       $this->response(["status"=>0]);
     }
   }
   public function pelanggaranupdate_post()
   {
     $dpost = $this->input->post(null,true);
     foreach ($dpost as $key => &$value) {
       if ($value == "") {
         unset($dpost[$key]);
       }
     }
     $this->main->setTable("tbl_pelanggaran");
     $id = ["id_pelanggaran"=>$dpost["id_pelanggaran"]];
     unset($dpost["id_pelanggaran"]);
     $up = $this->main->update($dpost,$id);
     if ($up) {
       $this->response(["status"=>1]);
     }else{
       $this->response(["status"=>0]);
     }
   }
   public function pelanggaranread_get()
   {
     $data = [];
     $data["data"] = [];
     $this->main->setTable("tbl_pelanggaran");
     $get = $this->main->get();
     foreach ($get->result() as $key => $value) {
       $this->main->setTable("tbl_kp");
       $value->id_kp = $this->main->get(["id_kp"=>$value->id_kp])->row()->nama_kp;
       $data["data"][] = [$value->id_pelanggaran,$value->id_kp,$value->jumlah,$value->tahun];
     }
     $this->response($data);
   }
   public function kmeans_get()
   {
      $kmeans = new KMeans(2);
      $this->main->setTable("tbl_pelanggaran");
      $mobil = $this->main->get(["id_kp"=>1])->result();
      $motor = $this->main->get(["id_kp"=>2])->result();
      $newmobil = [];
      $newmotor = [];
      foreach ($mobil as $key => $value) {
        $newmobil[] = $value->jumlah;
      }
      foreach ($motor as $key => $value) {
        $newmotor[] = $value->jumlah;
      }
      $construct = [$newmotor,$newmobil];
      $construct = array_map(null, ...$construct);
      $res = $kmeans->cluster($construct);
      $k1 = array_map(null,...$res[0]);
      $k2 = array_map(null,...$res[1]);
      $rescentroid = [$k1,$k2];
      $rebuild = [[array_sum($rescentroid[0][0])/count($rescentroid[0][0]),array_sum($rescentroid[0][1])/count($rescentroid[0][1])],[array_sum($rescentroid[1][0])/count($rescentroid[1][0]),array_sum($rescentroid[1][1])/count($rescentroid[1][1])]];
      $this->response(["data"=>$rebuild]);
   }

}
