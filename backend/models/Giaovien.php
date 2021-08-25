<?php
require_once 'models/Model.php';
require_once 'models/Pagination.php';
class Giaovien extends Model
{
    private $cn;
    public $str_search = '';

		function __construct(){
			$this->cn = new Model();
		}

    public function getAll()
    {
        $sql = "SELECT giaovien.*, BoMon.tenBoMon AS tenBoMon FROM giaovien
        INNER JOIN BoMon ON GiaoVien.maBoMon = BoMon.maBoMon";

        return $this->cn->FetchAll($sql); 
    }
    public function ThemGiaoVien($maGiaoVien, $tenGiaoVien, $maBoMon, $vaiTro)
	  {
        $now = date("Y-m-d H:i:s");
        $sql = "INSERT INTO giaovien VALUES($maGiaoVien, '$tenGiaoVien', $maBoMon, '$now', '$vaiTro')";
        //return $sql;
        return $this->cn->ExecuteQuery($sql);
	  }
    public function SuaGiaoVien($maGiaoVien, $tenGiaoVien, $maBoMon, $vaiTro)
	  {
        //$now = date("Y-m-d H:i:s");
        $sql = "UPDATE giaovien SET tenGiaoVien = '$tenGiaoVien',vaiTro = '$vaiTro',maBoMon = $maBoMon WHERE maGiaoVien = $maGiaoVien";

        //return $sql;
			  return $this->cn->ExecuteQuery($sql);
	  }
    
    public function TimKiem($maGiaoVien, $tenGiaoVien)
    {
        $maGiaoVien = trim($maGiaoVien) == ''? '" "' : $maGiaoVien;

        $timten = trim($tenGiaoVien) == ''? '' : "OR tenGiaoVien like '%$tenGiaoVien%'";

        $sql = "SELECT giaovien.*, BoMon.tenBoMon AS tenBoMon FROM GiaoVien
        INNER JOIN BoMon ON GiaoVien.maBoMon = BoMon.maBoMon WHERE maGiaoVien = $maGiaoVien $timten";
        
        return $this->cn->FetchAll($sql); 
    }
    function XoaGiaoVien($ma)
		{
			  $sql = "DELETE FROM giaovien WHERE maGiaoVien = $ma";

			  return $this->cn->ExecuteQuery($sql);
		}

}