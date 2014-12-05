
import UIKit


struct Product {
    
    let name: String
    let price: Float
    
    init(name:String, price: Float){
        self.name = name
        self.price = price
    }
    
}


class ShoppingCart {
    
    private var products: [Product] = []
    
    func addProduct(product: Product, quantity: Int){
        for _ in 1...quantity {
            products.append(product)
        }
    }
    
    func total() -> Float{
        return products.reduce(0.0, combine: { (acc: Float, product: Product) -> Float in
            return acc + product.price
        })
    }
    
    func descont() -> Float{
        return products.filter( { $0.price > 800 } ).map({ $0.price * 0.05 }).reduce(0.0,+)
    }
    
    func brazilPrice() -> [Product]{
        return products.map({ Product(name: $0.name, price:$0.price * 2.56 * 2.1) })
    }
    
}

let shoppingCart = ShoppingCart();

shoppingCart.addProduct(Product(name: "Iphone 6 4.7-inch",price: 649.00), quantity: 2)
shoppingCart.addProduct(Product(name: "Mac Air 13-inch",price: 1199.00), quantity: 1)
shoppingCart.addProduct(Product(name: "Ipad Air 2",price: 729.00), quantity: 1)
shoppingCart.addProduct(Product(name: "iMac 5K Display",price: 2499.00), quantity: 1)

shoppingCart.total()
shoppingCart.descont()
shoppingCart.total() - shoppingCart.descont()


shoppingCart.brazilPrice()




