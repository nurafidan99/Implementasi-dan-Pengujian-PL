#include <stdio.h>
#include <string.h>

#define MAX_ORDERS 100

typedef struct {
    char customerName[50];
    char serviceType[20];
    float weight;
    float price;
    char status[20];
} Order;

Order orders[MAX_ORDERS];
int totalOrders = 0;

void AddOrder(char customerName[], char serviceType[], float weight) {
    if (totalOrders < MAX_ORDERS) {
        totalOrders++;

        strcpy(orders[totalOrders - 1].customerName, customerName);
        strcpy(orders[totalOrders - 1].serviceType, serviceType);
        orders[totalOrders - 1].weight = weight;

        // Menghitung harga berdasarkan jenis layanan
        float pricePerKg;
        if (strcmp(serviceType, "Cuci Kering") == 0)
            pricePerKg = 5000;
        else if (strcmp(serviceType, "Cuci Setrika") == 0)
            pricePerKg = 8000;
        else if (strcmp(serviceType, "Setrika Saja") == 0)
            pricePerKg = 3000;
        else
            pricePerKg = 0;

        orders[totalOrders - 1].price = pricePerKg * weight;
        strcpy(orders[totalOrders - 1].status, "Belum Selesai");

        printf("Order laundry untuk %s telah ditambahkan.\n", customerName);
    } else {
        printf("Tidak bisa menambah order lagi, kapasitas penuh.\n");
    }
}

void DisplayOrders() {
    if (totalOrders == 0) {
        printf("Tidak ada order yang tersedia.\n");
    } else {
        for (int i = 0; i < totalOrders; i++) {
            printf("Order #%d:\n", i + 1);
            printf("Nama Pelanggan: %s\n", orders[i].customerName);
            printf("Layanan: %s\n", orders[i].serviceType);
            printf("Berat: %.2f Kg\n", orders[i].weight);
            printf("Harga: Rp %.2f\n", orders[i].price);
            printf("Status: %s\n", orders[i].status);
            printf("---------------------------\n");
        }
    }
}

void CompleteOrder(int orderNumber) {
    if (orderNumber > 0 && orderNumber <= totalOrders) {
        strcpy(orders[orderNumber - 1].status, "Selesai");
        printf("Order #%d telah diselesaikan.\n", orderNumber);
    } else {
        printf("Order tidak ditemukan.\n");
    }
}

int main() {
    // Menambahkan beberapa order laundry
    AddOrder("Budi", "Cuci Kering", 3.0);
    AddOrder("Siti", "Cuci Setrika", 5.0);
    AddOrder("Andi", "Setrika Saja", 2.0);

    // Menampilkan semua order laundry
    printf("\nDaftar Order Laundry:\n");
    DisplayOrders();

    // Menyelesaikan order pertama
    printf("\n");
    CompleteOrder(1);

    // Menampilkan status setelah perubahan
    printf("\nDaftar Order Laundry Setelah Perubahan:\n");
    DisplayOrders();

    return 0;
}
