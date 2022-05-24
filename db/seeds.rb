john = User.create(name: 'John Doe', email: 'john.doe@example.com', password: 'password123')

john_groceries = Category.create(name: 'Groceries', icon: 'shopping-cart', user: john)
john_entertainment = Category.create(name: 'Entertainment', icon: 'gamepad', user: john)
john_health = Category.create(name: 'Health', icon: 'hospital', user: john)

Expense.create(name: 'Eggs', amount: 9.99, user: john, category: john_groceries)
Expense.create(name: 'Movies', amount: 19.99, user: john, category: john_entertainment)
Expense.create(name: 'Pills', amount: 5.99, user: john, category: john_health)

caroline = User.create(name: 'Caroline Stone', email: 'caroline.stone@example.com', password: 'password123')

caroline_groceries = Category.create(name: 'Groceries', icon: 'shopping-cart', user: caroline)
caroline_health = Category.create(name: 'Health', icon: 'hospital', user: caroline)

Expense.create(name: 'Eggs', amount: 9.99, user: caroline, category: caroline_groceries)
Expense.create(name: 'Veggies', amount: 5.99, user: caroline, category: caroline_groceries)
Expense.create(name: 'Pills', amount: 5.99, user: caroline, category: caroline_health)
