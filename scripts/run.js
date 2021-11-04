const main = async () => {
    const nftContractFactory = await hre.ethers.getContractFactory("flowerNFT");
    const nftContract = await nftContractFactory.deploy();
    await nftContract.deployed();
    console.log("Contract deployed to:", nftContract.address);

    // mint 1 token
    let txn = await nftContract.mintNFT()
    await txn.wait()

    //2
    txn = await nftContract.mintNFT()
    await txn.wait()

    //3
    txn = await nftContract.mintNFT()
    await txn.wait()

};

const runMain = async () => {
    try {
        await main();
        process.exit(0);
    } catch (error) {
        console.log(error);
        process.exit(1);
    }
};

runMain();
