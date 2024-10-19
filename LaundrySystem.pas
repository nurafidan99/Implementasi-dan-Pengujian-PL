program LaundrySystem;

uses crt;

const
    MAX_ORDERS = 100;

type
    Order = record
        customerName: string[50];
        serviceType: string[20];
        weight: real;
        price: real;
        status: string[20];
    end;

var
    orders: array[1..MAX_ORDERS] of Order;
    totalOrders: integer;

// Fungsi untuk menambahkan pesanan baru
procedure AddOrder(customerName: string; serviceType: string; weight: real);
var
    pricePerKg: real;
begin
    if totalOrders < MAX_ORDERS then
    begin
        totalOrders := totalOrders + 1;
        orders[totalOrders].customerName := customerName;
        orders[totalOrders].serviceType := serviceType;
        orders[totalOrders].weight := weight;

        // Menghitung harga berdasarkan jenis layanan
        if serviceType = 'Cuci Kering' then
            pricePerKg := 5000
        else if serviceType = 'Cuci Setrika' then
            pricePerKg := 8000
        else if serviceType = 'Setrika Saja' then
            pricePerKg := 3000
        else
            pricePerKg := 0;

        orders[totalOrders].price := pricePerKg * weight;
        orders[totalOrders].status := 'Belum Selesai';

        writeln('Order laundry untuk ', customerName, ' telah ditambahkan.');
    end
    else
        writeln('Tidak bisa menambah order lagi, kapasitas penuh.');
end;

// Fungsi untuk menampilkan semua pesanan
procedure DisplayOrders;
var
    i: integer;
begin
    if totalOrders = 0 then
        writeln('Tidak ada order yang tersedia.')
    else
    begin
        for i := 1 to totalOrders do
        begin
            writeln('Order #', i, ':');
            writeln('Nama Pelanggan: ', orders[i].customerName);
            writeln('Layanan: ', orders[i].serviceType);
            writeln('Berat: ', orders[i].weight:4:2, ' Kg');
            writeln('Harga: Rp ', orders[i].price:4:2);
            writeln('Status: ', orders[i].status);
            writeln('---------------------------');
        end;
    end;
end;

// Fungsi untuk menyelesaikan pesanan
procedure CompleteOrder(orderNumber: integer);
begin
    if (orderNumber > 0) and (orderNumber <= totalOrders) then
    begin
        orders[orderNumber].status := 'Selesai';
        writeln('Order #', orderNumber, ' telah diselesaikan.');
    end
    else
        writeln('Order tidak ditemukan.');
end;

begin
    clrscr;
    totalOrders := 0;

    // Menambahkan beberapa order laundry
    AddOrder('Budi', 'Cuci Kering', 3.0);
    AddOrder('Siti', 'Cuci Setrika', 5.0);
    AddOrder('Andi', 'Setrika Saja', 2.0);

    // Menampilkan semua order laundry
    writeln;
    writeln('Daftar Order Laundry:');
    DisplayOrders;

    // Menyelesaikan order pertama
    writeln;
    CompleteOrder(1);

    // Menampilkan status setelah perubahan
    writeln;
    writeln('Daftar Order Laundry Setelah Perubahan:');
    DisplayOrders;

    readln;
end.
