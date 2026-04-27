using System;
using System.Collections.Generic;

public class Program
{
	public static void Main()
	{
		List<Item> items = new List<Item>();
		items.Add(new Table());
		items.Add(new Paddle());
		items.Add(new Paddle());
		items.Add(new Balls());
		items.Add(new Balls());
		items.Add(new Balls());
		
		foreach (Item i in items)
		{
			Console.WriteLine("This " + i.GetType().Name + " costs: $" + i.getFullPrice());
		}
	}
}

public abstract class Item
{
	protected int price;
	protected float weight;
	abstract public float getFullPrice();
	public float Weight { get {return weight;}}
}

public class Table : Item
{
	new public int price =200;
	new public float weight = 100f;
	public override float getFullPrice() =>  price + (price * 20) / 100;
}
public class Paddle : Item
{
	new public int price =20;
	new public float weight = 2f;
	public override float getFullPrice() =>  price + (price * 20) / 100;
}
public class Balls : Item
{
	new public int price =10;
	new public float weight = 0.5f;
	public override float getFullPrice() =>  price + (price * 20) / 100;
}