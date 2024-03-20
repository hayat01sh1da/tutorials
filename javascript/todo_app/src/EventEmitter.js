"use strict;"

const EventEmitter = class {
  constructor() {
    this._listeners = new Map();
  }
  
  addEventListener(eventType, listener) {
    if (!this._listeners.has(eventType)) {
      this._listeners.set(eventType, new Set());
    }
    const listenerSet = this._listeners.get(eventType);
    listenerSet.add(listener);
  }
  
  emit(eventType) {
    const listenerSet = this._listeners.get(eventType);
    if (!listenerSet) {
      return;
    }
    listenerSet.forEach(listener => {
      listener.call(this);
    });
  }
  
  removeEventListener(eventType, listener) {
    const listenerSet = this._listeners.get(eventType);
    if (!listenerSet) {
      return;
    }
    listenerSet.forEach(ownListener => {
      if (ownListener === listener) {
        listenerSet.delete(listener);
      }
    });
  }
};

export {
  EventEmitter
}
