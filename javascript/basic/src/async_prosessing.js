"use strict;"

const blockTime = (timeout) => {
  const startTime = Date.now();
  while (true) {
    const diff = Date.now() - startTime;
    if (timeout <= diff) {
      return `${timeout} millisecond seconds have passed.`;
    }
  }
};

const getAsyncProcesses1 = (timeout, millisec) => {
  const processes = [];
  processes.push(`A callback func will start in ${millisec} milliseconds.`)
  setTimeout(() => {
    processes.push("The blocking process is starting now.");
    blockTime(timeout);
    processes.push("The blocking process is done.");
  }, millisec);
  processes.push("A sysc process will start now.");
  return processes;
};

const getAsyncProcesses2 = (timeout, millisec) => {
  const processes = [];
  const startTime = Date.now();
  setTimeout(() => {
    const endTime = Date.now();
    processes.push(`It took ${endTime - startTime} milliseconds till an async process started.`);
  }, millisec);
  processes.push("The blocking process is starting now.");
  blockTime(timeout);
  processes.push("The blocking process is done.");
  return processes;
};

const handleAsyncError = () => {
  setTimeout(() => {
    try {
      throw new Error("Error");
    } catch (error) {
      return "It succeeds in catching an error.";
    }
    return "It failed to catch an error.";
  }, 10)
};

const onFulfilled = (response) => {
  return response;
};

const onRejected = (error) => {
  return error;
};

const dummyFetch = (file_path) => {
  return new Promise((resolve, reject) =>{
    setTimeout(() =>{
      if (file_path.startsWith("/success")) {
        resolve({ body: `Response body of ${file_path}` });
      } else {
        reject("Not Found");
      }
    }, 1000)
  })
};

const throwPromise = () => {
  return new Promise((resolve, reject) => {
    throw new Error("An error raised");
  });
};

const asyncTask1 = (val) => {
  if (val > 10) {
    return Promise.resolve("The value fulfills the requirement.");
  } else {
    return Promise.reject(new Error("The value must be more than 10."));
  }
};

const asyncMultiply = (num) => {
  return num * 10;
};

const getPromiseInCallbackFunc = () => {
  const vals = [];
  return Promise.resolve().then(() => {
    Promise.reject(new Error("Error Raised!!").catch(onRejected));
  }).then(() => {
    vals.push(1);
  }).catch((error) => {
    vals.push(2);
  }).then(() => {
    vals.push(3);
  }).then(() => {
    return vals;
  })
};

const asyncTask2 = (val) => {
  const vals = [];
  const promise = val > 10 ? Promise.resolve() : Promise.reject();
  return promise
  .then(() => {
    vals.push("Promise#then");
    return vals;
  }).catch(error => {
    vals.push("Promise#catch");
    return vals;
  }).finally(() => {
    vals.push("Promise#finally");
    return vals;
  })
};

const delay = (timeout) => {
  return new Promise(resolve => {
    setTimeout(() => {
      resolve(timeout);
    }, timeout);
  });
};

const timeOut = (timeout) => {
  return new Promise((resolve, reject) => {
    setTimeout(() => {
      reject(new Error(`Timeout: ${timeout} milliseconds have passed.`));
    }, timeout);
  });
};

const resolveFunc = async () => {
  return "This is an Async Function";
};

const rejectFunc = async () => {
  return Promise.reject(new Error("Error Raised!!"));
};

const exceptionFunc = async () => {
  throw new Error("Error Raised!!");
};

const ayancMain1 = async () => {
  const val = await Promise.resolve(42);
  return val;
};

const ayancMain2 = async () => {
  try {
    const val = await Promise.reject(new Error("Error Raised!!"));
  } catch (error) {
    return error.message;
  }
};

const fetchResourceAB1 = () => {
  const responses = [];
  return dummyFetch("/success/A.json").then(response => {
    responses.push(response);
    return dummyFetch("/success/B.json");
  }).then(response => {
    responses.push(response);
    return responses;
  })
};

const fetchResourceAB2 = async () => {
  const responses = [];
  const resourceA = await dummyFetch("/success/A.json");
  responses.push(resourceA);
  const resourceB = await dummyFetch("/success/B.json");
  responses.push(resourceB);
  return responses;
};

const fetchResources = async (resources) => {
  const result = [];
  for (let i = 0; resources.length; i++) {
    const resource = await dummyFetch(resources[i]);
    result.push(resource);
  }
};

const fetchAllResources = async (resources) => {
  const promises = resources.map(resource => {
    return dummyFetch(resource)
  });
  const responses = await Promise.all(promises);
  return responses.map(response => {
    return response.body;
  });
};

export {
  blockTime,
  getAsyncProcesses1,
  getAsyncProcesses2,
  handleAsyncError,
  onFulfilled,
  onRejected,
  dummyFetch,
  throwPromise,
  asyncTask1,
  asyncMultiply,
  getPromiseInCallbackFunc,
  asyncTask2,
  delay,
  timeOut,
  resolveFunc,
  rejectFunc,
  exceptionFunc,
  ayancMain1,
  ayancMain2,
  fetchResourceAB1,
  fetchResourceAB2,
  fetchResources,
  fetchAllResources
};
