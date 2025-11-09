
function multiplication(a,b,iters=1){
    let total = a;
    for (let i = 0; i<iters; i++){
        total = total*b;
    }
    console.log(total)
    return total
}

function main(input){
    let x = input[0] + input[4]
    let y = input[3] - input[2]

    let n = multiplication(x,y,input[1])

    let m = n / input[3]

    console.log(x,y,n,m)
}

const data = [1,2,3,5,7,9,11]
main(data)