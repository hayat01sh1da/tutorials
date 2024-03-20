interface User {
  id: number;
  name: string;
}

const UserAccount = class {
  id: number;
  name: string;
  constructor(id: number, name: string) {
    this.id = id,
    this.name = name
  }
};

export { UserAccount };
