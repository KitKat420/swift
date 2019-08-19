struct Increment {
    var num1: Int
    var num2: Int
    
            // no parameters
    func increment() -> [Increment] {
        // array for storing instances
        var arrayOfInstances: [Increment] = []
        
            // iteration
        for increase in 1...100 {
                // instance of Increment that is being iterated
            let incrementByOne = Increment(num1: increase, num2: increase)
            // appending instances to an array
            arrayOfInstances.append(incrementByOne)
        }
       return arrayOfInstances
    }
    
}

let call = Increment(num1: 1, num2: 1)

// instances method
call.increment()









