<?php

define(constant_name: 'MAX_ORDERS', 100);

$orders = [];
$totalOrders = 0;

// Fungsi untuk menambahkan pesanan baru
function AddOrder($customerName, $serviceType, $weight) {
    global $orders, $totalOrders;
    
    if ($totalOrders < MAX_ORDERS) {
        $totalOrders++;

        $order = [];
        $order['customerName'] = $customerName;
        $order['serviceType'] = $serviceType;
        $order['weight'] = $weight;

        // Menghitung harga berdasarkan jenis layanan
        if ($serviceType == 'Cuci Kering') {
            $pricePerKg = 5000;
        } elseif ($serviceType == 'Cuci Setrika') {
            $pricePerKg = 8000;
        } elseif ($serviceType == 'Setrika Saja') {
            $pricePerKg = 3000;
        } else {
            $pricePerKg = 0;
        }

        $order['price'] = $pricePerKg * $weight;
        $order['status'] = 'Belum Selesai';

        $orders[$totalOrders - 1] = $order;

        echo "Order laundry untuk " . $customerName . " telah ditambahkan.<br>";
    } else {
        echo "Tidak bisa menambah order lagi, kapasitas penuh.<br>";
    }
}

// Fungsi untuk menampilkan semua pesanan
function DisplayOrders() {
    global $orders, $totalOrders;
    
    if ($totalOrders == 0) {
        echo "Tidak ada order yang tersedia.<br>";
    } else {
        for ($i = 0; $i < $totalOrders; $i++) {
            echo "Order #" . ($i + 1) . ":<br>";
            echo "Nama Pelanggan: " . $orders[$i]['customerName'] . "<br>";
            echo "Layanan: " . $orders[$i]['serviceType'] . "<br>";
            echo "Berat: " . number_format($orders[$i]['weight'], 2) . " Kg<br>";
            echo "Harga: Rp " . number_format($orders[$i]['price'], 2) . "<br>";
            echo "Status: " . $orders[$i]['status'] . "<br>";
            echo "---------------------------<br>";
        }
    }
}

// Fungsi untuk menyelesaikan pesanan
function CompleteOrder($orderNumber) {
    global $orders, $totalOrders;
    
    if ($orderNumber > 0 && $orderNumber <= $totalOrders) {
        $orders[$orderNumber - 1]['status'] = 'Selesai';
        echo "Order #" . $orderNumber . " telah diselesaikan.<br>";
    } else {
        echo "Order tidak ditemukan.<br>";
    }
}

// Menambahkan beberapa order laundry
AddOrder("Budi", "Cuci Kering", 3.0);
AddOrder("Siti", "Cuci Setrika", 5.0);
AddOrder("Andi", "Setrika Saja", 2.0);

// Menampilkan semua order laundry
echo "<br>Daftar Order Laundry:<br>";
DisplayOrders();

// Menyelesaikan order pertama
echo "<br>";
CompleteOrder(1);

// Menampilkan status setelah perubahan
echo "<br>Daftar Order Laundry Setelah Perubahan:<br>";
DisplayOrders();

?>
