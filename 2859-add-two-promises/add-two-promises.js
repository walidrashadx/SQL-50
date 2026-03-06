/**
 * @param {Promise} promise1
 * @param {Promise} promise2
 * @return {Promise}
 */
async function addTwoPromises(promise1, promise2) {
    // Wait for both promises to resolve concurrently
    const [val1, val2] = await Promise.all([promise1, promise2]);
    
    // Return the sum
    return val1 + val2;
};