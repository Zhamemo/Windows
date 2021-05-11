#include <iostream>
#include <cmath>

using namespace std;

void rod4(double u, double v, double w, double a, double b, double c, double theta)
{
	double R11 = u*u + (v*v + w*w)*cos(theta);
	double R12 = u*v*(1 - cos(theta)) - w*sin(theta);
	double R13 = u*w*(1 - cos(theta)) + v*sin(theta);
	double R21 = u*v*(1 - cos(theta)) + w*sin(theta);
	double R22 = v*v + (u*u + w*w)*cos(theta);
	double R23 = v*w*(1 - cos(theta)) - u*sin(theta);
	double R31 = u*w*(1 - cos(theta)) - v*sin(theta);
	double R32 = v*w*(1 - cos(theta)) - u*sin(theta);
	double R33 = w*w + (u*u + v*v)*cos(theta);
	double T1 = (a*(v*v + w*w) - u*(b*v + c*w))*(1 - cos(theta)) + (b*w - c*v)*sin(theta);
	double T2 = (b*(u*u + w*w) - v*(a*u + c*w))*(1 - cos(theta)) + (c*u - a*w)*sin(theta);
	double T3 = (c*(v*v + u*u) - w*(a*u + b*v))*(1 - cos(theta)) + (a*v - b*u)*sin(theta);
	cout << endl;
	cout << "rotation:" << endl;
	cout << R11 << " " << R12 << " " << R13 << ";" << endl;
	cout << R21 << " " << R22 << " " << R23 << ";" << endl;
	cout << R31 << " " << R32 << " " << R33 << endl;
	cout << "translation:" << endl;
	cout << T1 << endl;
	cout << T2 << endl;
	cout << T3 << endl;
}

int main() {
	// double a=-0.0209;
	//double b= -1.7508;
	// double c=-45.4847;
	double a = -5.5481;
	double b = -231.369;
	double c = 11.8016;

	double u = -0.021271428545646;
	double v = -0.978865846282897;
	double w = 0.203394152591697;

	double theta = -2 * 3.1415926 / 180;
	/*
	double a=0;
	double b=100;
	double c=0;
	double u=0;
	double v=0;
	double w=1;
	*/
	cout << "hello world" << endl;
	rod4(u, v, w, a, b, c, theta);
	// rod4(u,v,w,a,b,c,2*theta);
	// rod4(u,v,w,a,b,c,3*theta);
	//rod4(u,v,w,a,b,c,4*theta);
	system("pause");
	return 0;
}

