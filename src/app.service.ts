import { Injectable } from '@nestjs/common';

@Injectable()
export class AppService {
  getHello(): string {
    return 'Aqui é a Maré Wiki! Projeto de documentação colaborativa da Maré.';
  }
}
