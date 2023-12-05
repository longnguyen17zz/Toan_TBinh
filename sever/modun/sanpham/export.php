<?php
require('../config/config2.php');
require_once dirname( __FILE__ ) .'../../../public/Classes/PHPExcel.php';

if(isset($_POST['postEx'])){
    $objExcel = new PHPExcel();
    $objExcel->setActiveSheetIndex(0);
    $sheet = $objExcel->getActiveSheet()->setTitle('Sản phẩm');

    $rowCount = 1;
    $sheet->setCellValue('A1'.$rowCount,'Tên sản phẩm');
    $sheet->setCellValue('B1'.$rowCount,'Giá sản phẩm');
    $sheet->setCellValue('C1'.$rowCount,'Size sản phẩm');
    $sheet->setCellValue('D1'.$rowCount,'Màu sản phẩm');
    $sheet->setCellValue('E1'.$rowCount,'Mã sản phẩm');

    $result = mysqli_query($conn, 'SELECT * FROM tbl_spbanchay');
    while($row = mysqli_fetch_array($result)){
        $rowCount++;
        $sheet->setCellValue('A1'.$rowCount, 'hung');
        $sheet->setCellValue('B1'.$rowCount, 'hung');
        $sheet->setCellValue('C1'.$rowCount, 'hung');
        $sheet->setCellValue('D1'.$rowCount, 'hung');
        $sheet->setCellValue('E1'.$rowCount, 'hung');
    }
    // Redirect output to a client’s web browser (Excel2007)
    header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
    header('Content-Disposition: attachment;filename="01simple.xlsx"');
    header('Cache-Control: max-age=0');
    $objWriter = PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel2007');
    $objWriter->save('php://output');
    exit;

    

   
}



?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <form method="POST">
        <button name='postEx' type="submit">xuất</button>
    </form>
</body>
</html>