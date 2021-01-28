


const HDWalletProvider = require('@truffle/hdwallet-provider');
const Web3 = require('Web3')
const fs = require('fs');
const mnemonic = fs.readFileSync(".secret").toString().trim();
const path = require('path')

const provider = new HDWalletProvider(mnemonic, 'https://kovan.infura.io/v3/...')

const web3 = new Web3(provider)

const jsonFile = "../build/contracts/Chainlink.json";

// console.log('path', path.resolve(__dirname, jsonFile))
let rawdata = fs.readFileSync(path.resolve(__dirname, jsonFile));
const json = JSON.parse(rawdata);
// console.log(json);

const chainlinkABI = json.abi;

const chainlinkInstance = new web3.eth.Contract(chainlinkABI, "") // 合约地址


chainlinkInstance.methods.getPrice().send({
    from: "" // 钱包地址
}).then((res,) => {
    console.log('getPrice: res', res)

    chainlinkInstance.methods.price().call({
        from: "" // 钱包地址
    }).then((res) => {
        console.log('price:res', res)
    })

})

