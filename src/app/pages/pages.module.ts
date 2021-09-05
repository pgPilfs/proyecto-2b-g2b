import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { LoginComponent } from './login/login.component';
import { SignUpComponent } from './sign-up/sign-up.component';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { LandingPageComponent } from './landing-page/landing-page.component';
import { HomeComponent } from './home/home.component';


@NgModule({
  declarations: [
    LoginComponent,
    SignUpComponent,
    LandingPageComponent,
    HomeComponent
  ],
  imports: [
    CommonModule, FormsModule, ReactiveFormsModule,
  ]
})
export class PagesModule { }
