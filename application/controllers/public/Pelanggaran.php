<?php
defined('BASEPATH') OR exit('No direct script access allowed');
/**
 * @author Indra Gunanda
 */
class Pelanggaran extends CI_Controller{
  /**
 	 * Konstruktor
 	 *
 	 * @return void
	 */

  public function __construct()
  {
    parent::__construct();
    $this->load->model("crud/main");
  }
  /**
 	 * Index Home
 	 *
 	 * @return void
	 */

  function index()
  {
    // Where Folder View ?
    $this->template->setFolder("admin");
    $this->template->defaultStyle("admin");
    $build = [
      "block_title"=>"Master Pelanggaran"
    ];
    $this->template->setjs([
      base_url("assets/main/pelanggaran.js")
    ],true);
    // Render
    $this->template->renderHTML(['head','pelanggaran','foot'],['title'=>"Pelanggaran",'other'=>$build]);
  }

}
