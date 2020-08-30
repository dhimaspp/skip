// //implicit types
// let color = "blue";

// color = "red";

// // console.log(color);

// //explicit types
// let age: number;

// age = 152;

// //function types
// function tambahan(a: number, b: number) {
//   return a + b;
// }
// tambahan(1, 2);

//funtion null/undefined
// function someFunc(n: number) {
//   if (n / 2 === 4) {
//     return "even";
//   }
//   return null;
// }
// const value = someFunc(4);
// console.log(value);

// function printLabel(labeledObj: { label: string }) {
//   console.log(labeledObj.label);
// }

// let myObj = { size: 10, label: "Size 10 Object" };
// printLabel(myObj);

//interface is name to build a structure of types
interface SquareConfig {
  color?: string;
  width?: number;
}

function rumusPersegi(config: SquareConfig): { color: string; area: number } {
  let newSquare = { color: "white", area: 100 };
  if (config.color) {
    newSquare.color = config.color;
  }
  if (config.width) {
    newSquare.area = config.width * config.width;
  }
  return newSquare;
}

let mySquare = rumusPersegi({ color: "white", width: 10 });
console.log(mySquare);
