#include <iostream>
#include <vector>
#include <string>

using namespace std;

int main()
{
    //Given
    vector<int> arr {
        1, 2, 3, 4, 5
    };

    int aux = 0;
    int n = arr.size();

    for (int i = 0; i < n/2; ++i) {
        aux = arr[n-i-1];
        arr[n-i-1] = arr[i];
        arr[i] = aux;
    }

    for (const int& number : arr) {
        cout << number << " ";
    }
    cout << endl;
}