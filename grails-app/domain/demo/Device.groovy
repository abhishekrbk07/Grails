package demo

class Device {
    String name // Laptop, Monitor, Headphone, Mouse

    static constraints = {
        name blank: false, unique: true, inList: ['Laptop', 'Monitor', 'Headphone', 'Mouse']
    }

    String toString() { name }
}
